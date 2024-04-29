package com.g3.ism.resources;


import com.google.gson.JsonElement;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import java.lang.reflect.Type;
import java.time.LocalDateTime;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author tranh
 */
public class LocalDateTimeAdapter implements JsonSerializer<LocalDateTime>{

    @Override
    public JsonElement serialize(LocalDateTime t, Type type, JsonSerializationContext jsc) {
        return new JsonPrimitive(t.toString());
    }
    
}
