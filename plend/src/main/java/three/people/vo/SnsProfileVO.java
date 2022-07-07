package three.people.vo;

public class SnsProfileVO extends SnsVO {
	//kakao
	private String properties;
	private String kakao_account;
	private Long kakaoid;
	
	//naver
	private String resultcode;
	private String message;
	private String response; // 하위에 속성들이 있음 클래스로 만들어야함
	private String age;
	private String birthyear;
	private String mobile;
	private String id;
	
	//google
	private String aud;
	private String sub;
	
	//common
	private String name;
	private String nickname;
	private String email;
	private String gender;
	private String birthday;
	private String age_range;
	
	
	public String getProperties() {
		return properties;
	}
	public void setProperties(String properties) {
		this.properties = properties;
	}
	public String getKakao_account() {
		return kakao_account;
	}
	public void setKakao_account(String kakao_account) {
		this.kakao_account = kakao_account;
	}
	public Long getKakaoid() {
		return kakaoid;
	}
	public void setKakaoid(Long kakaoid) {
		this.kakaoid = kakaoid;
	}
	public String getResultcode() {
		return resultcode;
	}
	public void setResultcode(String resultcode) {
		this.resultcode = resultcode;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getResponse() {
		return response;
	}
	public void setResponse(String response) {
		this.response = response;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getBirthyear() {
		return birthyear;
	}
	public void setBirthyear(String birthyear) {
		this.birthyear = birthyear;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAud() {
		return aud;
	}
	public void setAud(String aud) {
		this.aud = aud;
	}
	public String getSub() {
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getAge_range() {
		return age_range;
	}
	public void setAge_range(String age_range) {
		this.age_range = age_range;
	}
	
	
	
}
