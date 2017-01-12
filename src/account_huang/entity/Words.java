package account_huang.entity;

public class Words {
    private String id;
    private String content;
    private String topNo;
    private String orderNo;
    private String holdername;

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
        this.content = content == null ? null : content.trim();
    }

    public String getTopNo() {
        return topNo;
    }

    public void setTopNo(String topNo) {
        this.topNo = topNo;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getHoldername() {
        return holdername;
    }

    public void setHoldername(String holdername) {
        this.holdername = holdername == null ? null : holdername.trim();
    }
}