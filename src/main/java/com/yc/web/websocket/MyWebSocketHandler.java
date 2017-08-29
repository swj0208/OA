package com.yc.web.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;
import com.yc.bean.Chat;
import com.yc.bean.Users;
import com.yc.utils.DateUtil;

/**
 * Socket处理器
 */
@Component
public class MyWebSocketHandler implements WebSocketHandler {
	
	private static final ArrayList<WebSocketSession> users;
	private static int onlineCount;
	
	static {
		users = new ArrayList<WebSocketSession>();
		onlineCount=0;
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		users.add(session);
		addOnlineCount();
		
		sendOnlineCount();
		
		sendUsers();

	}

	/**
	 * 消息处理，在客户端通过Websocket API发送的消息会经过这里，然后进行相应的处理
	 * Invoked when a new WebSocket message arrives.
	 */	
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		if (message.getPayloadLength() == 0)
			return;
		Chat chat = new Gson().fromJson(message.getPayload().toString(), Chat.class);
		Date date = new Date();
		DateUtil du=new DateUtil();
		
		chat.setChatDate(du.parseDateToString(date, null));
				
		Gson gson=new Gson();
		//发给部门
		if(chat.getToUid()==null||"".equals(chat.getToUid())){
			sendMessageToDepartment(chat.getToDid(),new TextMessage(gson.toJson(chat)));
		}else {
			sendMessageToUser(chat.getToUid(),new TextMessage(gson.toJson(chat)));
		}
		
	}
	
	
	/**
	 * 给某个用户发送消息
	 */
	public void sendMessageToUser(Integer toUid, TextMessage message) {
		for (WebSocketSession user : users) {
			Users u=(Users) user.getAttributes().get("user");
			if (u.getUid().equals(toUid)) {
				try {
					if (user.isOpen()) {
						user.sendMessage(message);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
				break;
			}
		}
	}
	
	/**
	 * 给某个部门发送消息
	 *
	 * @param userName
	 * @param message
	 */
	public void sendMessageToDepartment(Integer toDid, TextMessage message) {
		for (WebSocketSession user : users) {
			Users u=(Users) user.getAttributes().get("user");
			if (u.getDid().equals(toDid)) {
				try {
					if (user.isOpen()) {
						user.sendMessage(message);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable error) throws Exception {
		if (session.isOpen()) {
			subOnlineCount();
			sendOnlineCount();
			sendUsers();
			session.close();
		}
		users.remove(session);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus arg1) throws Exception {
		users.remove(session);
		subOnlineCount(); 
		sendOnlineCount();
		sendUsers();
	}

	@Override
	public boolean supportsPartialMessages() {
		return false;
	}

	public static synchronized int getOnlineCount() {
		return onlineCount;
	}

	public static synchronized void addOnlineCount() {
		MyWebSocketHandler.onlineCount++;
	}

	public static synchronized void subOnlineCount() {
		MyWebSocketHandler.onlineCount--;
	}
	
	//发送在线人数
	public void sendOnlineCount() throws IOException{
		Map<String, Integer> map=new HashMap<String,Integer>();
		map.put("onlineCount", onlineCount);
		Gson gson=new Gson();
		String num=gson.toJson(map);
		
		for (WebSocketSession user : users){
			user.sendMessage(new TextMessage(num));
		}
	}
	
	//发送在线人员列表
	public void sendUsers() throws IOException{
		List<Users> list=new ArrayList<Users>();
		for (WebSocketSession user : users){
			Users u=(Users) user.getAttributes().get("user");
			list.add(u);
		}
		Map<String, List<Users>> map=new HashMap<String, List<Users>>();
		map.put("userList", list);
		Gson gson=new Gson();
		String userList=gson.toJson(map);
		
		for (WebSocketSession user : users){
			user.sendMessage(new TextMessage(userList));
		}
	}
	

}
