package controller;

import java.util.HashMap;

import org.json.simple.JSONObject;

import service.SHA256;

public class TTT {
	public static void main(String[] args) {
		String t = "1234";
		
		SHA256 s = new SHA256();
		System.out.println(s.sha256(t));
		System.out.println(s.sha256("1234"));
		System.out.println(s.sha256("admin1234"));
	}
}
