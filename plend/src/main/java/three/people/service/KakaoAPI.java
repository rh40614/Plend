package three.people.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import three.people.vo.KakaoVO;


@Service
public class KakaoAPI  {

	//컨트롤러에서 사용할 메서드 만들기 
	//화면에서 파라미터로 넘겨준 code값을 받아오고 POST로 요청을 보내서 토큰을 발급받기 
	 public String getAccessToken (String authorize_code) {
	     System.out.println("----------------------------토큰발급---------------------------");
		 String access_Token = "";
	     String refresh_Token = "";
	     String id_token ="";
	     
	     //토큰발급 요청을 보낼 주소
	     String reqURL = "https://kauth.kakao.com/oauth/token";
	        
	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            
	            // POST 요청을 위해 기본값이 false인 setDoOutput을 true로 //07.06 김연희 : 공부할것
	            
	            conn.setRequestMethod("POST");
	            conn.setDoOutput(true);
	            
	            // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	            StringBuilder sb = new StringBuilder();
	            sb.append("grant_type=authorization_code");
	            sb.append("&client_id=ab7da9e9cfc38c18cc1cac5e5ddc71f0");
	            sb.append("&redirect_uri=http://localhost:8090/controller/common/kakaoLogin");
	            sb.append("&code=" + authorize_code);
	            bw.write(sb.toString());
	            bw.flush();
	            
	            // 결과 코드가 200이라면 성공
	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);
	 
	            //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String line = "";
	            String result = "";
	            
	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);
	            
	            // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);
	            
	            access_Token = element.getAsJsonObject().get("access_token").getAsString();
	            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
	            id_token = element.getAsJsonObject().get("id_token").getAsString();
	            
	            System.out.println("access_token : " + access_Token);
	            System.out.println("refresh_token : " + refresh_Token);
	            System.out.println("id_token: "+ id_token);
	            
	            br.close();
	            bw.close();
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } 
	        
	        return access_Token;
	    }
	
	 
	 
	 
	 
	 	//회원정보 요청, 사용자 정보 보기 
	 	public KakaoVO userInfo(String access_Token) throws IOException {
	 		System.out.println("-------------------------사용자 정보 보기---------------------------");	 		
	 		//HashMap<String, Object> userInfo = new HashMap<String, Object>();
	 		KakaoVO userInfo = new KakaoVO();
	 		
	 		//토큰을 이용하여 카카오에 회원의 정보를 요청한다. // v1을 통한 '사용자 정보 요청'은 만료되었다. 
	 		String reqURl = "https://kapi.kakao.com/v2/user/me";
	 		
	 		try {
	 			//URL은 자바 어플리케이션과 URL연결과 관련한 모든 클래스의 슈퍼 클래스 
	 			//URlconnection과 HttpURLConnection 모두 추상클래스로서 인스턴슬르 직접 만들 수없다. 
	 			//따라서 URL객체를 생성하는 방식으로 그 하위의 HttpURLConnection 인스턴스를 사용할 수 있다.
	 			URL url = new URL(reqURl);
				HttpURLConnection conn = (HttpURLConnection)url.openConnection();
				conn.setRequestMethod("POST");
				//연결 완료
				
				//헤더 필드 읽기 
				//요청에 필요한 Header에 포함 될 내용 // 문서에서 지정해둔 양식 
				conn.setRequestProperty("Authorization", "Bearer " + access_Token);
				
				//응답코드 확인하기 
				int responseCode = conn.getResponseCode();
				System.out.println("responseCode: "+ responseCode);
				
				//입력스트림을 가지고 오고 데이터 읽기
				//inputStream은 데이터를 바이트의 배열로 읽어 오는 low-level의 메서드
				//따라서 데이터를 문자 '데이터'로 읽기 위해서 InputStreamReader로 매핑
				//데이터를 문자'열'로 읽기 위해서 inputStream을 BufferedReader로 매핑하기
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
				
				
				String line="";
				String result ="";
				
				while((line= br.readLine()) != null) {
					result += line;
				}
				System.out.println("response body: " + result);
				
				
				
				// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);
	            
	            //System.out.println(element.getAsJsonObject().get("id").getAsLong());
	            //JsonElement.getAsJsonObject().get("key value").getAs타입(); 의 형태로 파싱한다. 
	           	//응답데이터(JSON)
	            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	            Long id = element.getAsJsonObject().get("id").getAsLong();
	            
	            //파싱된 json데이터를 string에 담기
	            //properties
	            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	          
	            //kakao_account
	            String email = kakao_account.getAsJsonObject().get("email").getAsString();
	            String gender = kakao_account.getAsJsonObject().get("gender").getAsString();
	            String birthday = kakao_account.getAsJsonObject().get("birthday").getAsString();
	            String age_range = kakao_account.getAsJsonObject().get("age_range").getAsString();
	            
	            System.out.println("id: "+ id);
	            System.out.println("nickname: "+nickname);
	            
	            //setter이용하여 KakaoVO에 담기 
	            userInfo.setKakaoId(id);
	            userInfo.setNickname(nickname);
	            userInfo.setAccount_email(email);
	            userInfo.setAge_range(age_range);
	            userInfo.setGender(gender);
	            userInfo.setBirthday(birthday);
	            
	            //HashMap에 담기
//	            userInfo.put("nickname", nickname);
//	            userInfo.put("email", email);
//	            userInfo.put("gender", gender);
//	            userInfo.put("birthday", birthday);
//	            userInfo.put("age_range", age_range);
	            
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	 		
	 		
	 		
	 		return userInfo;
	 	}
	 	
	 	
	 
	 	
	 	
	 	public void logout(String access_Token, Long KakaoId ) throws IOException {
	 		System.out.println("----------------------------로그아웃---------------------------");
	 		//연결을 요청할 경로 주소에 담기
	 		String reqURl = "https://kapi.kakao.com/v1/user/logout";
	 		String KakaoAK ="82ee6c3c0d09a5994f67a32f32867738";
	 		
	 		//URL객체 생성해서 HttpURLConnection 인스턴스 생성해서 이용하기 
	 		URL url;
	 		
			try {
				url = new URL(reqURl);
				HttpURLConnection conn = (HttpURLConnection)url.openConnection();
				conn.setRequestMethod("POST");
				//기본값이 false이므로 true로 바꿔줘야한다.
				conn.setDoOutput(true);
				//H: 
				conn.setRequestProperty("Authorization", "KakaoAK " + KakaoAK);
				conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded ");
				
				
				//d:  POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	            StringBuilder sb = new StringBuilder();
	            sb.append("target_id_type=user_id");
	            sb.append("&target_id="+KakaoId);
	            
	            bw.write(sb.toString());
	            bw.flush();
				//응답 확인
				int responseCode = conn.getResponseCode();
				System.out.println("responseCode: "+ responseCode);
				
				
				
				
				//데이터열 읽기	// 데이터 인코딩 
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
				
				
				String result ="";
				String line ="";
				
				while((line = br.readLine()) != null) {
					result += line;
				}
				System.out.println(result);
				
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	 		
	 		
	 	}
	 	
	 	
	 	
	 	
	 	
	 
	 	
	 	
	 	
	 	
	 	
	 	
	 	
	 	
	 	
	 	
	
}
