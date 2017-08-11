package com.yc.utils;

import java.lang.reflect.Type;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.yc.web.model.JsonModel;

public class JsonModelToJson {

	public String toJson(JsonModel jsonModel){
		Gson gson = new Gson();
		Type jsonType = new TypeToken<JsonModel>(){
		}.getType();
		String jsonStr = gson.toJson(jsonModel,jsonType);
		return jsonStr;
	}
}
