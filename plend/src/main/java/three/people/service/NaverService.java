package three.people.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import three.people.vo.SnsProfileVO;
import three.people.vo.SnsVO;

@Service
public class NaverService implements SnsService {
	
	SnsVO vo = new SnsProfileVO();
	
	public SnsVO loginApiURL() throws UnsupportedEncodingException {
		
		vo.setNaver_redirect_uri(URLEncoder.encode(vo.getNaver_redirect_uri(), "UTF-8"));
		SecureRandom random = new SecureRandom();
	    vo.setState(new BigInteger(130, random).toString());
	    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	    apiURL += "&client_id=" + vo.getNaver_client_id();
	    apiURL += "&redirect_uri=" + vo.getNaver_redirect_uri();
	    apiURL += "&state=" + vo.getState();
	    
	    vo.setApiURL(apiURL);
		
		return vo;
	}
	
	@Override
	public SnsVO getAccessToken(SnsVO snsVO) {
		String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + snsVO.getNaver_client_id();
	    apiURL += "&client_secret=" + snsVO.getNaver_client_secret();
	    apiURL += "&redirect_uri=" + snsVO.getNaver_redirect_uri();
	    apiURL += "&code=" + snsVO.getCode();
	    apiURL += "&state=" + snsVO.getState();
		
	    try {
		      URL url = new URL(apiURL);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
			
		      int responseCode = con.getResponseCode();
		      BufferedReader br;
		      
		      if(responseCode==200) {
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      while ((inputLine = br.readLine()) != null) {
		    	ObjectMapper mapper = new ObjectMapper();
			    snsVO = mapper.readValue(inputLine, SnsVO.class);
		      }
		      br.close();
		    } catch (Exception e) {
		      System.out.println(e);
		    }
		return snsVO;
	}

	@Override
	public SnsProfileVO getUserProfile(SnsVO snsVO) throws IOException {
		SnsProfileVO snsProfile = new SnsProfileVO();
		
		String token = snsVO.getAccess_token();
		String header = "Bearer " + token;
		String apiURL = "https://openapi.naver.com/v1/nid/me";
		
		Map<String, String> requestHeaders = new HashMap<String, String>();
		requestHeaders.put("Authorization", header);
		
		snsProfile = get(apiURL, requestHeaders);
		return snsProfile;
	}
	
	private static SnsProfileVO get(String apiURL, Map<String,String> requestHeaders) throws IOException {
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		
		try {
			con.setRequestMethod("GET");
			for(Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}
			int responseCode = con.getResponseCode();
			if(responseCode == HttpURLConnection.HTTP_OK) {
				return readyBody(con.getInputStream());
			}else {
				return readyBody(con.getErrorStream());
			}
		}catch(IOException e){
			throw new RuntimeException("API Error", e);
		}finally {
			con.disconnect();
		}
	}
	
	private static SnsProfileVO readyBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);
		SnsProfileVO snsProfile = new SnsProfileVO();
		
		try(BufferedReader lineReader = new BufferedReader(streamReader)){
			String line;
			while((line = lineReader.readLine()) != null) {
				System.out.println("line: +" + line.toString());
				ObjectMapper mapper = new ObjectMapper();
				mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
				snsProfile = mapper.readValue(line, SnsProfileVO.class);
				snsProfile = mapper.readValue(snsProfile.getResponse().toString(), SnsProfileVO.class);
				
			}
			return snsProfile;
		}catch(IOException e) {
			throw new RuntimeException("API bufferedReader error", e);
		}
	}



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
