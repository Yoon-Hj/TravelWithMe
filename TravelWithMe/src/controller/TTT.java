package controller;

import java.util.HashMap;

import org.json.simple.JSONObject;

public class TTT {
	public static void main(String[] args) {
		System.out.println("??");
		HashMap<String, String> a = new HashMap<String, String>();
		a.put("a", "a");
		a.put("b", "b");
		a.put("c", "c");
		a.put("d", "d");
		
		JSONObject j = new JSONObject();
		
		j.put("result", a);
		System.out.println(a);
		System.out.println("==========================");
		System.out.println(j);
		System.out.println("==========================");
		System.out.println(j.get("result"));
		
	}
}
