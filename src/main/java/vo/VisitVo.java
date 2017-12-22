package vo;

import java.util.Date;

public class VisitVo {
	
	int idx;
	String name,content,pwd,regdate;
	
	Date regdate_date;

	public VisitVo(){}
	
	public VisitVo(String name, String content, String pwd) {
		super();
		this.name = name;
		this.content = content;
		this.pwd = pwd;
	}
	
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getRegdate() {
		return regdate.substring(0, 16);
		
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public Date getRegdate_date() {
		return regdate_date;
	}

	public void setRegdate_date(Date regdate_date) {
		this.regdate_date = regdate_date;
	}	
}
