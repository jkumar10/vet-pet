package com.jndi;

import java.util.Random;

public class OTPGen {
	private String otp;
	
	public OTPGen() {
		Random rand = new Random();
		int i1 = rand.nextInt(1000);
		int i2 = rand.nextInt(1000);
		this.otp = ""+i1 + i2;
	}
	
	public String getOtp() {
		return this.otp;
	}
	
	public static void main(String[] args) {
		//OTPGen gen = new OTPGen();
		//System.out.println(gen.getOtp());
	}
}