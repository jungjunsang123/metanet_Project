package com.mycompany.myapp.domain;

public class MemberDTO {
	private String id;
	private String password;
	private String name;
	private String cityNum;
	private String nickName; 
	private String pr;
	private String registerDate;
	private String updateDate;
	private String authority;
	public MemberDTO(String id, String password, String name, String cityNum, String nickName, String pr,
			String registerDate, String updateDate, String authority) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.cityNum = cityNum;
		this.nickName = nickName;
		this.pr = pr;
		this.registerDate = registerDate;
		this.updateDate = updateDate;
		this.authority = authority;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCityNum() {
		return cityNum;
	}
	public void setCityNum(String cityNum) {
		this.cityNum = cityNum;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getPr() {
		return pr;
	}
	public void setPr(String pr) {
		this.pr = pr;
	}
	public String getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", password=" + password + ", name=" + name + ", cityNum=" + cityNum
				+ ", nickName=" + nickName + ", pr=" + pr + ", registerDate=" + registerDate + ", updateDate="
				+ updateDate + ", authority=" + authority + "]";
	}
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
