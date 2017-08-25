package com.yc.websocket.websocket;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

/**
 * WebScoket配置处理器
 */
@Component
@EnableWebSocket
public class WebSocketConfig extends WebMvcConfigurerAdapter implements WebSocketConfigurer {
//实现WebSocketConfigurer接口
	@Resource
	MyWebSocketHandler handler;
	  
	// 配置websocket入口，注册Handler、SockJs支持和拦截器	 
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		//registry.addHandler注册和路由的功能，当客户端发起websocket连接，
		//	把/path交给对应的handler处理，而不实现具体的业务逻辑，可以理解为收集和任务分发中心。
		//addInterceptors，为handler添加拦截器
		//注册handler类
		registry.addHandler(handler, "/ws").addInterceptors(new HandShake());
		//用于开启 sockjs 支持
		registry.addHandler(handler, "/ws/sockjs").addInterceptors(new HandShake()).withSockJS();
	}

}
