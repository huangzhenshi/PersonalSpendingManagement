package account_huang.entity;


public class ElseDetail{
	 private String id;
	 private String times;
	 private String columnName;
	 private Integer value;
	 private String holderName;
	 //specialCol 用来临时保存一些参数，并没有确切的业务意义
	 private String specialCol;
	 public String getSpecialCol() {
		return specialCol;
	}
	public void setSpecialCol(String specialCol) {
		this.specialCol = specialCol;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTimes() {
		return times;
	}
	public void setTimes(String times) {
		this.times = times;
	}
	public String getColumnName() {
		return columnName;
	}
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	public Integer getValue() {
		return value;
	}
	public void setValue(Integer value) {
		this.value = value;
	}
	public String getHolderName() {
		return holderName;
	}
	public void setHolderName(String holderName) {
		this.holderName = holderName;
	}
	
	
	
	 
}
