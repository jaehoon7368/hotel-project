package com.sh.airbnb.user.model.dto;



public class User {

	private int userNo;
	private String userId;
	private String password;
	private String userName;
	private String phone;
	private UserRole userRole;
	private String email;
	private String nickName;
	private UserStatus userStatus;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(int userNo, String userId, String password, String userName, String phone, UserRole userRole,
			String email, String nickName, UserStatus userStatus) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.password = password;
		this.userName = userName;
		this.phone = phone;
		this.userRole = userRole;
		this.email = email;
		this.nickName = nickName;
		this.userStatus = userStatus;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public UserRole getUserRole() {
		return userRole;
	}

	public void setUserRole(UserRole userRole) {
		this.userRole = userRole;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public UserStatus getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(UserStatus userStatus) {
		this.userStatus = userStatus;
	}

	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userId=" + userId + ", password=" + password + ", userName=" + userName
				+ ", phone=" + phone + ", userRole=" + userRole + ", email=" + email + ", nickName=" + nickName
				+ ", userStatus=" + userStatus + "]";
	}

}
