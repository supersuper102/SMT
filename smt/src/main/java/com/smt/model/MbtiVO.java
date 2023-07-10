package com.smt.model;

public class MbtiVO {
	private int idx;

	private String mbti_tres; // 타입결과
	private String mbti_res; // 타입 글
	private String mbti_bres; // 과거 타입

	public MbtiVO() {

	}
	public int getIdx() {
		return idx;
	}
	
	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getMbti_tres() {
		return mbti_tres;
	}

	public void setMbti_tres(String mbti_tres) {
		this.mbti_tres = mbti_tres;
	}

	public String getMbti_res() {
		return mbti_res;
	}

	public void setMbti_res(String mbti_res) {
		this.mbti_res = mbti_res;
	}

	public String getMbti_bres() {
		return mbti_bres;
	}

	public void setMbti_bres(String mbti_bres) {
		this.mbti_bres = mbti_bres;
	}
}
