package model;

import java.util.Date;

public class Post {
	private int id;
	private String content;
	private Date postDate;
	private User user;
	
	public Post() {}

	public Post(int id) {
		this.id = id;
	}

	public Post(int id, String content, Date postDate, User user) {
		this.id = id;
		this.content = content;
		this.postDate = postDate;
		this.user = user;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}