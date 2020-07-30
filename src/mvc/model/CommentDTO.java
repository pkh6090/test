package mvc.model;

public class CommentDTO { //테이블 구조와 똑같은 자바프로그램
	
	private int num; //멤버변수
	private String id;	
	private String content;
	private String regdate;
	private int num2;
	private int nowpage;	
	
	public CommentDTO() {
		super(); //상위클래스의 기본생성자 실행
	}

	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public int getNum2() {
		return num2;
	}


	public void setNum2(int num2) {
		this.num2 = num2;
	}

	public int getNowpage() {
		return nowpage;
	}

	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}
	
	
	
	
}
