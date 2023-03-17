package com.aw.anyware.approval.vo;

import java.util.ArrayList;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Approval {
	
	private int approNo;
	
	private String writerNo;
	private String writerDept;
	private String writerName;
	private String writerJob;
	
	private int tplNo;
	private String tplTitle;
	
	private String approTitle;
	private String approContent;
	
	private int interNo;
	private String interDept;
	private String interName;
	private String interJob;
	private String interAppro;
	
	private int finalNo;
	private String finalDept;
	private String finalName;
	private String finalJob;
	private String finalAppro;
	
	private String createDate;
	
	
}
