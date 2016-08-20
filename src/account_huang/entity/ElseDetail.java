package account_huang.entity;

import java.io.Serializable;

public class ElseDetail implements Serializable{
	 private static final long serialVersionUID = -5170895077622072639L;
	 private String id;
	 private String times;
	 private String columnName;
	 private Integer value;
	 private String holderName;
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
