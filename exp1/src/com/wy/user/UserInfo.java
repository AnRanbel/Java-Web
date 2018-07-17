package com.wy.user;

public class UserInfo {

	private String userName; 
	private String userPwd;
	private String userSex;
	private String userTel;
	private String userEmail;
	private String userAdd;
	private String userRealName;
	private String userDeliveryAddress;
	private String userBirthday;
	private String userConstellation;
	
	public UserInfo(){
		
	}
	
	public String getUserName(){
		return userName;
	}
	
	public void setUserName(String userName){
		this.userName=userName;
	}
	
	public String getUserPwd(){
		return userPwd;
	}
	
	public void setUserPwd(String userPwd){
		this.userPwd=userPwd;
	}
	
	public String getUserSex(){
		return userSex;
	}
	
	public void setUserSex(String userSex){
		this.userSex=userSex;
	}
	
	public String getUserTel(){
		return userTel;
	}
	
	public void setUserTel(String userTel){
		this.userTel=userTel;
	}
	
	public String getUserEmail(){
		return userEmail;
	}
	
	public void setUserEmail(String userEmail){
		this.userEmail=userEmail;
	}
	
	public String getUserAdd(){
		return userAdd;
	}
	
	public void setUserAdd(String userAdd){
		this.userAdd=userAdd;
	}

	public String getUserRealName() {
		return userRealName;
	}

	public void setUserRealName(String userRealName) {
		this.userRealName = userRealName;
	}

	public String getUserDeliveryAddress() {
		return userDeliveryAddress;
	}

	public void setUserDeliveryAddress(String userDeliveryAddress) {
		this.userDeliveryAddress = userDeliveryAddress;
	}

	public String getUserBirthday() {
		return userBirthday;
	}

	public void setUserBirthday(String userBirthday) {
		this.userBirthday = userBirthday;
	}

	public String getUserConstellation() {
		return userConstellation;
	}

	public void setUserConstellation(String userConstellation) {
		this.userConstellation = userConstellation;
	}
	
}
