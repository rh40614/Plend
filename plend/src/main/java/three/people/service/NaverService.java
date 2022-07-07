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

import three.people.vo.NaverProfileVO;
import three.people.vo.NaverVO;
import three.people.vo.SnsProfileVO;
import three.people.vo.SnsVO;

@Service
public class NaverService implements SnsService {

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
	public SnsProfileVO getUserProfile(SnsProfileVO profileVO) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
