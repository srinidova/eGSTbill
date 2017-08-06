package com.eGSTbill.util;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
			
		    int x = (int)(Math.random() * 9);
		    x = x + 1;
		    String randomPIN = (x + "") + ( ((int)(Math.random()*1000)) + "" );
		    //return randomPIN;
		System.out.println("randomPIN==="+randomPIN);
		}

	

}
