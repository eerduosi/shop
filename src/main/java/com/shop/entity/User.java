package com.shop.entity;

import javax.validation.constraints.Pattern;

public class User {
	private Integer userid;

	@Pattern(regexp = "^([a-zA-Z0-9_-]{6,16})|([\\u2E80-\\u9FFF]{2,5})$", message = "请输入2到5位中文,或者6到16位英文或数字的组合作为用户名")
	private String username;

	@Pattern(regexp = "^[a-zA-Z0-9]{6,16}$", message = "请输入6到16位字母,数字的组合作为密码")
	private String userpassword;

	@Pattern(regexp = "^1[0-9]{10}$", message = "请输入十一位数字作为手机号")
	private String userphone;

	private Integer usergender;

	@Pattern(regexp = "^([a-zA-Z0-9_-])|([\\u2E80-\\u9FFF])$", message = "请输入安全问题")
	private String userquestion;

	@Pattern(regexp = "^([a-zA-Z0-9_-])|([\\u2E80-\\u9FFF])$", message = "请输入安全问题答案")
	private String useranswer;

	private Integer usertype;

	private String usercreatetime;

	private String userupdatetime;

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username == null ? null : username.trim();
	}

	public String getUserpassword() {
		return userpassword;
	}

	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword == null ? null : userpassword.trim();
	}

	public String getUserphone() {
		return userphone;
	}

	public void setUserphone(String userphone) {
		this.userphone = userphone == null ? null : userphone.trim();
	}

	public Integer getUsergender() {
		return usergender;
	}

	public void setUsergender(Integer usergender) {
		this.usergender = usergender;
	}

	public String getUserquestion() {
		return userquestion;
	}

	public void setUserquestion(String userquestion) {
		this.userquestion = userquestion == null ? null : userquestion.trim();
	}

	public String getUseranswer() {
		return useranswer;
	}

	public void setUseranswer(String useranswer) {
		this.useranswer = useranswer == null ? null : useranswer.trim();
	}

	public Integer getUsertype() {
		return usertype;
	}

	public void setUsertype(Integer usertype) {
		this.usertype = usertype;
	}

	public String getUsercreatetime() {
		return usercreatetime;
	}

	public void setUsercreatetime(String usercreatetime) {
		this.usercreatetime = usercreatetime;
	}

	public String getUserupdatetime() {
		return userupdatetime;
	}

	public void setUserupdatetime(String userupdatetime) {
		this.userupdatetime = userupdatetime;
	}

	public User(Integer userid, String username, String userpassword, String userphone, Integer usergender,
			String userquestion, String useranswer, Integer usertype, String usercreatetime, String userupdatetime) {
		super();
		this.userid = userid;
		this.username = username;
		this.userpassword = userpassword;
		this.userphone = userphone;
		this.usergender = usergender;
		this.userquestion = userquestion;
		this.useranswer = useranswer;
		this.usertype = usertype;
		this.usercreatetime = usercreatetime;
		this.userupdatetime = userupdatetime;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "User [userid=" + userid + ", username=" + username + ", userpassword=" + userpassword + ", userphone="
				+ userphone + ", usergender=" + usergender + ", userquestion=" + userquestion + ", useranswer="
				+ useranswer + ", usertype=" + usertype + ", usercreatetime=" + usercreatetime + ", userupdatetime="
				+ userupdatetime + "]";
	}
	
	

}