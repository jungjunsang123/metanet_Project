package com.mycompany.myapp.domain;


//@Getter
//@Setter
//@ToString
//@NoArgsConstructor
//@AllArgsConstructor
public class PostDTO {
	 private String postNo;
	 private String content;
	 private String writeDate;
	 private String image;
	 private MemberDTO memberDTO;
	public String getPostNo() {
		return postNo;
	}
	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public MemberDTO getMemberDTO() {
		return memberDTO;
	}
	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}
	
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	@Override
	public String toString() {
		return "PostDTO [postNo=" + postNo + ", content=" + content + ", writeDate=" + writeDate + ", image=" + image
				+ ", memberDTO=" + memberDTO + "]";
	}
	public PostDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}// end
