package com.redemi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class ProccerManefacture {
	@Qualifier("meditake")
	@Autowired
	Redemi processer1;
	@Qualifier("snapdragone")
	@Autowired
	Redemi processer2;
	public Redemi getProcesser1() {
		return processer1;
	}
	public void setProcesser1(Redemi processer1) {
		this.processer1 = processer1;
	}
	public Redemi getProcesser2() {
		return processer2;
	}
	public void setProcesser2(Redemi processer2) {
		this.processer2 = processer2;
	}
	
	

}
