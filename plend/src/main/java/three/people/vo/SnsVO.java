package three.people.vo;

public class SnsVO {
	
	//kakao
	private String kakao_client_id = "9eeaaad82ff062eca88a250baa02bf00";
	private String kakaoAK = "";
	private String id_token;
	private String kakao_redirect_uri = "http://jjezen.cafe24.com/plend/common/kakaoLogin";
	
	//naver
	private String naver_client_id = "yuDMbMbNqBLt1ltRxtOG";
	private String naver_client_secret = "xCVm9skXrf";
	private String naver_redirect_uri = "http://jjezen.cafe24.com/plend/common/naverLogin.do";
	
	//google
	private String google_client_id = "6376522390-jl2ldl1oicg3v38pq83n8d6q5fe781of.apps.googleusercontent.com";
	private String google_redirect_uri = "http://localhost:8090/controller/sns/googleRedirect.do";
	private String credential;
	
	
	//common
	private String grant_type;
	private String code;
	private String state;
	private String refresh_token;
	private String access_token;
	private String service_provider;
	private String token_type;
	private String expires_in;
	private String apiURL;
	
	
	public String getKakao_client_id() {
		return kakao_client_id;
	}
	public void setKakao_client_id(String kakao_client_id) {
		this.kakao_client_id = kakao_client_id;
	}
	public String getKakaoAK() {
		return kakaoAK;
	}
	public void setKakaoAK(String kakaoAK) {
		this.kakaoAK = kakaoAK;
	}
	public String getId_token() {
		return id_token;
	}
	public void setId_token(String id_token) {
		this.id_token = id_token;
	}
	public String getKakao_redirect_uri() {
		return kakao_redirect_uri;
	}
	public void setKakao_redirect_uri(String kakao_redirect_uri) {
		this.kakao_redirect_uri = kakao_redirect_uri;
	}
	public String getNaver_client_id() {
		return naver_client_id;
	}
	public void setNaver_client_id(String naver_client_id) {
		this.naver_client_id = naver_client_id;
	}
	public String getNaver_client_secret() {
		return naver_client_secret;
	}
	public void setNaver_client_secret(String naver_client_secret) {
		this.naver_client_secret = naver_client_secret;
	}
	public String getNaver_redirect_uri() {
		return naver_redirect_uri;
	}
	public void setNaver_redirect_uri(String naver_redirect_uri) {
		this.naver_redirect_uri = naver_redirect_uri;
	}
	public String getGoogle_client_id() {
		return google_client_id;
	}
	public void setGoogle_client_id(String google_client_id) {
		this.google_client_id = google_client_id;
	}
	public String getGoogle_redirect_uri() {
		return google_redirect_uri;
	}
	public void setGoogle_redirect_uri(String google_redirect_uri) {
		this.google_redirect_uri = google_redirect_uri;
	}
	public String getCredential() {
		return credential;
	}
	public void setCredential(String credential) {
		this.credential = credential;
	}
	public String getGrant_type() {
		return grant_type;
	}
	public void setGrant_type(String grant_type) {
		this.grant_type = grant_type;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getRefresh_token() {
		return refresh_token;
	}
	public void setRefresh_token(String refresh_token) {
		this.refresh_token = refresh_token;
	}
	public String getAccess_token() {
		return access_token;
	}
	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}
	public String getService_provider() {
		return service_provider;
	}
	public void setService_provider(String service_provider) {
		this.service_provider = service_provider;
	}
	public String getToken_type() {
		return token_type;
	}
	public void setToken_type(String token_type) {
		this.token_type = token_type;
	}
	public String getExpires_in() {
		return expires_in;
	}
	public void setExpires_in(String expires_in) {
		this.expires_in = expires_in;
	}
	public String getApiURL() {
		return apiURL;
	}
	public void setApiURL(String apiURL) {
		this.apiURL = apiURL;
	}
	
	
	
}
