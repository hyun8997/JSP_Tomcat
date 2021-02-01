package vo;

//VO (Value Object) : DBMS���� �ǵ����ִ� ���ڵ� 1���� �����͸� ���� �� �ִ� ��ü
//ĸ��ȭ : ���� - private / �޼ҵ� (getter, setter) - public
//Beans, Java Bean, JSP Bean 

// DTO, POJO

public class DeptVO {
	private int deptno;
	private String dname;
	private String loc;
	
	public DeptVO() {}

	public DeptVO(int deptno, String dname, String loc) {
		super();
		this.deptno = deptno;
		this.dname = dname;
		this.loc = loc;
	}

	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}
	
	
	
	
	
	
}
