package comment;

import java.sql.Timestamp;

public class CommentBean {
private int num;
private String id,content;
private Timestamp date;


public Timestamp getDate() {
	return date;
}
public void setDate(Timestamp date) {
	this.date = date;
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
public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}


}
