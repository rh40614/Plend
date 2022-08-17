package three.people.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import three.people.vo.SnsProfileVO;
import three.people.vo.SnsVO;
import three.people.vo.UserVO;

@Service
public class KakaoService implements SnsService {
	
	SnsVO vo = new SnsProfileVO();
	@Autowired
	private CommonService commonService;
	
	public SnsVO loginApiURL() throws UnsupportedEncodingException {
		
	    String apiURL = "https://kauth.kakao.com/oauth/authorize?response_type=code";
	    apiURL += "&client_id=" + vo.getKakao_client_id();
	    apiURL += "&redirect_uri=" + vo.getKakao_redirect_uri();
	   
	    vo.setApiURL(apiURL);
		
		return vo;
	}
	
	@Override
	public SnsVO getAccessToken(SnsVO snsVO) {
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			
			con.setRequestMethod("POST");
			con.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(con.getOutputStream()));
			String content = "";
			content += "grant_type=authorization_code";
			content += "&client_id="+snsVO.getKakao_client_id();
			content += "&redirect_uri="+snsVO.getKakao_redirect_uri();
			content += "&code="+snsVO.getCode();
			bw.write(content);
			bw.flush();
			
			int responseCode = con.getResponseCode();
			System.out.println("responseCode: "+responseCode);
			
			if(responseCode == 200) {
				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				String line = "";
				
				while((line = br.readLine()) != null) {
					ObjectMapper mapper = new ObjectMapper();
					mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
					snsVO = mapper.readValue(line, SnsVO.class);
				}
				br.close();
				return snsVO;
			}
			bw.close();
		}catch(IOException e) {
			e.printStackTrace();
		}
		return snsVO;
	}

	@Override
	public SnsProfileVO getUserProfile(SnsVO snsVO) throws IOException {
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		SnsProfileVO snsProfile = new SnsProfileVO();
		try {
			URL url = new URL(reqURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();

			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", "Bearer "+snsVO.getAccess_token());
			
			int responseCode = con.getResponseCode();
			System.out.println(responseCode);
			
			if(responseCode == 200) {
				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(),"utf-8"));
				String line = "";
				while((line = br.readLine()) != null) {
					System.out.println("line: "+line);
					ObjectMapper mapper = new ObjectMapper();
					mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
					snsProfile = mapper.readValue(line, SnsProfileVO.class);
					//snsProfile = mapper.readValue(snsProfile.getKakao_account().toString(), SnsProfileVO.class);
				}
				br.close();
				return snsProfile;
			}
		}catch(MalformedURLException e) {
			e.printStackTrace();
		}
		return snsProfile;
	}

	@Override
	public void snsUnlink(SnsProfileVO snsProfileVO) throws IOException {
		String reqURL = "https://kapi.kakao.com/v1/user/unlink";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();

			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "Bearer "+snsProfileVO.getAccess_token());
			
			int responseCode = con.getResponseCode();
			System.out.println(responseCode);
			
			if(responseCode == 200) {
				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(),"utf-8"));
				String line = "";
				while((line = br.readLine()) != null) {
					System.out.println("line: "+line);
				}
				br.close();
			}
		}catch(MalformedURLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public UserVO userCheck(SnsProfileVO snsProfileVO) throws IOException {
		String reqURL = "https://kapi.kakao.com/v1/user/access_token_info";
		UserVO userVO = new UserVO();
		try {
			URL url = new URL(reqURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();

			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", "Bearer "+snsProfileVO.getAccess_token());
			
			int responseCode = con.getResponseCode();
			System.out.println(responseCode);
			
			if(responseCode == 200) {
				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(),"utf-8"));
				String line = "";
				while((line = br.readLine()) != null) {
					ObjectMapper mapper = new ObjectMapper();
					mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
					snsProfileVO = mapper.readValue(line, SnsProfileVO.class);
					System.out.println("id: "+snsProfileVO.getId());
				}
				br.close();
				userVO.setKakao_id(snsProfileVO.getId());
				userVO = commonService.snsIdCheck(userVO);
				
			}
		}catch(MalformedURLException e) {
			e.printStackTrace();
		}
		return userVO;
	}

}
