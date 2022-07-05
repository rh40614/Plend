package three.people.vo;

import java.net.URLEncoder;

public class NaverVO {

	private String client_id = "yuDMbMbNqBLt1ltRxtOG";
	private String client_secret = "xCVm9skXrf";
	private String grant_type;
	private String code;
	private String state;
	private String refresh_token;
	private String access_token;
	private String service_provider;
	private String token_type;
	private String expires_in;
	private String redirect_uri = "http://localhost:8080/controller/callback.do";
	private String apiURL;
	
	
	public String getRedirect_uri() {
		return redirect_uri;
	}
	public void setRedirect_uri(String redirect_uri) {
		this.redirect_uri = redirect_uri;
	}
	public String getApiURL() {
		return apiURL;
	}
	public void setApiURL(String apiURL) {
		this.apiURL = apiURL;
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
	public String getGrant_type() {
		return grant_type;
	}
	public void setGrant_type(String grant_type) {
		this.grant_type = grant_type;
	}
	public String getClient_id() {
		return client_id;
	}
	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}
	public String getClient_secret() {
		return client_secret;
	}
	public void setClient_secret(String client_secret) {
		this.client_secret = client_secret;
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
	
	
}
