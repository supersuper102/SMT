package com.smt.model;

public class MemberVO {

	private int idx;
	private String userid;
	private String userpwd;

	private String name;
	private java.sql.Date bday;
	private String email;

	private String nick_name;
	private String pimage;
	private String mbti_type;

	private java.sql.Date indate;
	private int mstate;

	public MemberVO() {
		
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public java.sql.Date getBday() {
		return bday;
	}

	public void setBday(java.sql.Date bday) {
		this.bday = bday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNick_name() {
		return nick_name;
	}

	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	public String getMbti_type() {
		return mbti_type;
	}

	public void setMbti_type(String mbti_type) {
		this.mbti_type = mbti_type;
	}

	public java.sql.Date getIndate() {
		return indate;
	}

	public void setIndate(java.sql.Date indate) {
		this.indate = indate;
	}

	public int getMstate() {
		return mstate;
	}

	public void setMstate(int mstate) {
		this.mstate = mstate;
	}

	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", userid=" + userid + ", userpwd=" + userpwd + ", name=" + name + ", bday="
				+ bday + ", email=" + email + ", nick_name=" + nick_name + ", pimage=" + pimage + ", mbti_type="
				+ mbti_type + ", indate=" + indate + ", mstate=" + mstate + "]";
	}
	
	
}
