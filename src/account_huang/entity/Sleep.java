package account_huang.entity;

public class Sleep {
    private String id;
    private String times;
    private String getUp;
    private String getSleep;
    private String breakfast;
    private String lunch;
    private String dinner;
    private String remark;
    private String holderName;

    public String getBreakfast() {
		return breakfast;
	}

	public void setBreakfast(String breakfast) {
		this.breakfast = breakfast;
	}

	public String getLunch() {
		return lunch;
	}

	public void setLunch(String lunch) {
		this.lunch = lunch;
	}

	public String getDinner() {
		return dinner;
	}

	public void setDinner(String dinner) {
		this.dinner = dinner;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getTimes() {
        return times;
    }

    public void setTimes(String times) {
        this.times = times == null ? null : times.trim();
    }

    public String getGetUp() {
        return getUp;
    }

    public void setGetUp(String getUp) {
        this.getUp = getUp == null ? null : getUp.trim();
    }

    public String getGetSleep() {
        return getSleep;
    }

    public void setGetSleep(String getSleep) {
        this.getSleep = getSleep == null ? null : getSleep.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getHolderName() {
        return holderName;
    }

    public void setHolderName(String holderName) {
        this.holderName = holderName == null ? null : holderName.trim();
    }
}