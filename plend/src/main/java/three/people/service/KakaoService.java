package three.people.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import three.people.vo.SnsProfileVO;
import three.people.vo.SnsVO;

@Service
public class KakaoService implements SnsService {
	
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

	@Override
	public void userSignOut(SnsVO snsVO) {
		// TODO Auto-generated method stub
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
