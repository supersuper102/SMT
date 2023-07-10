package com.smt.model;






public class Mbti {
    private String type;
    private String celebrity;
    private String discussion;

    public Mbti() {}

    public Mbti(String type, String celebrity, String discussion) {
        this.type = type;
        this.celebrity = celebrity;
        this.discussion = discussion;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCelebrity() {
        return celebrity;
    }

    public void setCelebrity(String celebrity) {
        this.celebrity = celebrity;
    }

    public String getDiscussion() {
        return discussion;
    }

    public void setDiscussion(String discussion) {
        this.discussion = discussion;
    }
}

