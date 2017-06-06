package org.jnan.po;

import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonIgnore;

public class Course {
	private Integer cid;
	private String cname;
	private Integer ptime;
	private Set<Stu> stus=new HashSet<>();
	public Set<Stu> getStus() {
		return stus;
	}
	public void setStus(Set<Stu> stus) {
		this.stus = stus;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public Integer getPtime() {
		return ptime;
	}
	public void setPtime(Integer ptime) {
		this.ptime = ptime;
	}
}
