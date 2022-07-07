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

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import three.people.vo.NaverProfileVO;
import three.people.vo.NaverVO;

public class ExNaverService {
NaverVO vo = new NaverVO();
	
	public NaverVO loginApiURL() throws UnsupportedEncodingException {
	
		vo.setRedirect_uri(URLEncoder.encode(vo.getRedirect_uri(), "UTF-8"));
		SecureRandom random = new SecureRandom();
	    vo.setState(new BigInteger(130, random).toString());
	    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	    apiURL += "&client_id=" + vo.getClient_id();
	    apiURL += "&redirect_uri=" + vo.getRedirect_uri();
	    apiURL += "&state=" + vo.getState();
	    
	    vo.setApiURL(apiURL);
		
		return vo;
	}
	
	public NaverVO getAccessToken(NaverVO navervo) {
		String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + navervo.getClient_id();
	    apiURL += "&client_secret=" + navervo.getClient_secret();
	    apiURL += "&redirect_uri=" + navervo.getRedirect_uri();
	    apiURL += "&code=" + navervo.getCode();
	    apiURL += "&state=" + navervo.getState();
		
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
			    navervo = mapper.readValue(inputLine, NaverVO.class);
		      }
		      br.close();
		    } catch (Exception e) {
		      System.out.println(e);
		    }
		return navervo;
	}
	
	public NaverProfileVO getProfile(NaverVO navervo) throws IOException {
		NaverProfileVO nprofile = new NaverProfileVO();
		
		String token = navervo.getAccess_token(); 
        String header = "Bearer " + token; 
        String apiURL = "https://openapi.naver.com/v1/nid/me";

        Map<String, String> requestHeaders = new HashMap<String, String>();
        requestHeaders.put("Authorization", header);
        
        nprofile = get(apiURL, requestHeaders);
        
        
		return nprofile;
	}
	
	private static NaverProfileVO get(String apiUrl, Map<String, String> requestHeaders) throws IOException{
		URL url = new URL(apiUrl);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { 
                return readBody(con.getInputStream());
            } else { 
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 占쎌뒄筌ｏ옙�⑨옙 占쎌벓占쎈뼗 占쎈뼄占쎈솭", e);
        } finally {
            con.disconnect();
        }
    }
	
	private static NaverProfileVO readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);
        NaverProfileVO naverprofilevo = new NaverProfileVO();

        
       
        try (
        		
        	BufferedReader lineReader = new BufferedReader(streamReader)) {
            
        	String line;
            while ((line = lineReader.readLine()) != null) {
            	System.out.println("line: "+ line.toString());
            	ObjectMapper mapper = new ObjectMapper();
            	mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
            	naverprofilevo = mapper.readValue(line, NaverProfileVO.class);
            }

            return naverprofilevo;
        } catch (IOException e) {
            throw new RuntimeException("API 占쎌벓占쎈뼗占쎌뱽 占쎌뵭占쎈뮉占쎈쑓 占쎈뼄占쎈솭占쎈뻥占쎈뮸占쎈빍占쎈뼄..", e);
        }
    }
}
