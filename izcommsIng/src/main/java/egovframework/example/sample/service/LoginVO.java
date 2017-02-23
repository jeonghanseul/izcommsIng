package egovframework.example.sample.service;

import java.io.Serializable;

public class LoginVO implements Serializable{

	private static final long serialVersionUID = 6527574497394797459L;
	
	private String id;
	private String name;
	private String pwd;
	private String grade;
	private String message;
	//private String memberGroup;
	
//	public String getMemberGroup() {
//		return memberGroup;
//	}
//	public void setMemberGroup(String memberGroup) {
//		this.memberGroup = memberGroup;
//	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
