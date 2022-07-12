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

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import three.people.vo.SnsProfileVO;
import three.people.vo.SnsVO;

@Service
public class KakaoService implements SnsService {
	
	SnsVO vo = new SnsProfileVO(); 
	
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
			content += "&client_id=ab7da9e9cfc38c18cc1cac5e5ddc71f0";
			content += "&redirect_uri=http://localhost:8090/controller/common/kakaoLogin";
			content += "&code="+snsVO.getCode();
			bw.write(content);
			bw.flush();
			
			int responseCode = con.getResponseCode();
			System.out.println(responseCode);
			
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
					ObjectMapper mapper = new ObjectMapper();
					mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
					snsProfile = mapper.readValue(line, SnsProfileVO.class);
					snsProfile = mapper.readValue(snsProfile.getKakao_account().toString(), SnsProfileVO.class);
				}
				br.close();
				return snsProfile;
			}
		}catch(MalformedURLException e) {
			e.printStackTrace();
		}
		return snsProfile;
	}

	/*
	 * public void logout(String access_Token, Long KakaoId ) throws IOException {
	 * System.out.println(
	 * "----------------------------로그아웃---------------------------"); //연결을 요청할 경로
	 * 주소에 담기 String reqURl = "https://kapi.kakao.com/v1/user/logout"; String
	 * KakaoAK ="82ee6c3c0d09a5994f67a32f32867738";
	 * 
	 * //URL객체 생성해서 HttpURLConnection 인스턴스 생성해서 이용하기 URL url;
	 * 
	 * try { url = new URL(reqURl); HttpURLConnection conn =
	 * (HttpURLConnection)url.openConnection(); conn.setRequestMethod("POST");
	 * //기본값이 false이므로 true로 바꿔줘야한다. conn.setDoOutput(true); //H:
	 * conn.setRequestProperty("Authorization", "KakaoAK " + KakaoAK);
	 * conn.setRequestProperty("Content-Type",
	 * "application/x-www-form-urlencoded ");
	 * 
	 * 
	 * //d: POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송 BufferedWriter bw = new
	 * BufferedWriter(new OutputStreamWriter(conn.getOutputStream())); StringBuilder
	 * sb = new StringBuilder(); sb.append("target_id_type=user_id");
	 * sb.append("&target_id="+KakaoId);
	 * 
	 * bw.write(sb.toString()); bw.flush(); //응답 확인 int responseCode =
	 * conn.getResponseCode(); System.out.println("responseCode: "+ responseCode);
	 * 
	 * 
	 * 
	 * 
	 * //데이터열 읽기 // 데이터 인코딩 BufferedReader br = new BufferedReader(new
	 * InputStreamReader(conn.getInputStream(),"utf-8"));
	 * 
	 * 
	 * String result =""; String line ="";
	 * 
	 * while((line = br.readLine()) != null) { result += line; }
	 * System.out.println(result);
	 * 
	 * } catch (MalformedURLException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }
	 * 
	 * 
	 * }
	 */
	
	
	

	
}
