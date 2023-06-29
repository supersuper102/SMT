package com.smt.model;

public class MemberVO {

	private int idx;
	private String userid;
	private String userpwd;

	private String name;
	private java.sql.Date bday;
	private String hp1;
	private String hp2;
	private String hp3;

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

	public String getHp1() {
		return hp1;
	}

	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}

	public String getHp2() {
		return hp2;
	}

	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}

	public String getHp3() {
		return hp3;
	}

	public void setHp3(String hp3) {
		this.hp3 = hp3;
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
	
	public String getAllHp() {
		return hp1+"-"+hp2+"-"+hp3;
	}
	

	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", userid=" + userid + ", userpwd=" + userpwd + ", name=" + name + ", bday="
				+ bday + ", hp1=" + hp1 + ", hp2=" + hp2 + ", hp3=" + hp3 + ", nick_name=" + nick_name + ", pimage="
				+ pimage + ", mbti_type=" + mbti_type + ", indate=" + indate + ", mstate=" + mstate + "]";
	}

}
