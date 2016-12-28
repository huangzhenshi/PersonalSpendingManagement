package account_huang.entity;

public class Sleep {
    private String id;
    private String times;
    private String getUp;
    private String getSleep;
    private String remark;
    private String holderName;

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