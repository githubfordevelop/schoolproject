package com.chengxusheji.po;

import org.hibernate.validator.constraints.NotEmpty;
import org.json.JSONException;
import org.json.JSONObject;

public class Work {
	   /*论文id*/
    private Integer workId;
    public Integer getWorkId(){
        return workId;
    }
    public void setWorkId(Integer workId){
        this.workId = workId;
    }

    /*学科门类*/
    @NotEmpty(message="学科门类不能为空")
    private String xkml;
    public String getXkml() {
        return xkml;
    }
    public void setXkml(String xkml) {
        this.xkml = xkml;
    }

    /*论文名称*/
    @NotEmpty(message="论文名称不能为空")
    private String name;
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    /*论文封面图*/
    private String lwfm;
    public String getLwfm() {
        return lwfm;
    }
    public void setLwfm(String lwfm) {
        this.lwfm = lwfm;
    }

    /*作者*/
    @NotEmpty(message="作者不能为空")
    private String author;
    public String getAuthor() {
        return author;
    }
    public void setAuthor(String author) {
        this.author = author;
    }

  private String oneOther;
  
  public String getOneOther() {
	return oneOther;
}
public void setOneOther(String oneOther) {
	this.oneOther = oneOther;
}
public String getTwoOther() {
	return twoOther;
}
public void setTwoOther(String twoOther) {
	this.twoOther = twoOther;
}

private String twoOther;
  

    /*发布日期*/
    @NotEmpty(message="发布日期不能为空")
    private String publishDate;
    public String getPublishDate() {
        return publishDate;
    }
    public void setPublishDate(String publishDate) {
        this.publishDate = publishDate;
    }

    /*论文介绍*/
    @NotEmpty(message="论文介绍不能为空")
    private String thesisDesc;
    public String getThesisDesc() {
        return thesisDesc;
    }
    public void setThesisDesc(String thesisDesc) {
        this.thesisDesc = thesisDesc;
    }

    /*论文文件*/
    private String thesisFile;
    public String getThesisFile() {
        return thesisFile;
    }
    public void setThesisFile(String thesisFile) {
        this.thesisFile = thesisFile;
    }

    /*修改意见*/
    private String xgyj;
    public String getXgyj() {
        return xgyj;
    }
    public void setXgyj(String xgyj) {
        this.xgyj = xgyj;
    }

    private String state;
    
    
    public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

	/*提交用户*/
    private UserInfo userObj;
    public UserInfo getUserObj() {
        return userObj;
    }
    public void setUserObj(UserInfo userObj) {
        this.userObj = userObj;
    }

    public JSONObject getJsonObject() throws JSONException {
    	JSONObject jsonThesis=new JSONObject(); 
		jsonThesis.accumulate("workId", this.getWorkId());
		jsonThesis.accumulate("xkml", this.getXkml());
		jsonThesis.accumulate("name", this.getName());
		jsonThesis.accumulate("lwfm", this.getLwfm());
		jsonThesis.accumulate("author", this.getAuthor());
		jsonThesis.accumulate("oneOther", this.getOneOther());
		jsonThesis.accumulate("twoOther", this.getTwoOther());
		jsonThesis.accumulate("state", this.getState());
		jsonThesis.accumulate("publishDate", this.getPublishDate().length()>19?this.getPublishDate().substring(0,19):this.getPublishDate());
		jsonThesis.accumulate("thesisDesc", this.getThesisDesc());
		jsonThesis.accumulate("thesisFile", this.getThesisFile());
		jsonThesis.accumulate("xgyj", this.getXgyj());
		jsonThesis.accumulate("userObj", this.getUserObj().getName());
		jsonThesis.accumulate("userObjPri", this.getUserObj().getUser_name());
		return jsonThesis;
    }
}
