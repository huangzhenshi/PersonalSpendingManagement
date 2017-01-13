package account_huang.entity;

public class Blog {
    private String id;
    private String title;
    private String tagTime;
    private String lastTime;
    private String holdername;
    private String category;
    private String nextlevelCategory;
    private String content;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getTagTime() {
        return tagTime;
    }

    public void setTagTime(String tagTime) {
        this.tagTime = tagTime == null ? null : tagTime.trim();
    }

    public String getLastTime() {
        return lastTime;
    }

    public void setLastTime(String lastTime) {
        this.lastTime = lastTime == null ? null : lastTime.trim();
    }

    public String getHoldername() {
        return holdername;
    }

    public void setHoldername(String holdername) {
        this.holdername = holdername == null ? null : holdername.trim();
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category == null ? null : category.trim();
    }

    public String getNextlevelCategory() {
        return nextlevelCategory;
    }

    public void setNextlevelCategory(String nextlevelCategory) {
        this.nextlevelCategory = nextlevelCategory == null ? null : nextlevelCategory.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}