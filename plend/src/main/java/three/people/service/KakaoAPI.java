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

	//��Ʈ�ѷ����� ����� �޼��� ����� 
	//ȭ�鿡�� �Ķ���ͷ� �Ѱ��� code���� �޾ƿ��� POST�� ��û�� ������ ��ū�� �߱޹ޱ� 
	 public String getAccessToken (String authorize_code) {
	     System.out.println("----------------------------��ū�߱�---------------------------");
		 String access_Token = "";
	     String refresh_Token = "";
	     String id_token ="";
	     
	     //��ū�߱� ��û�� ���� �ּ�
	     String reqURL = "https://kauth.kakao.com/oauth/token";
	        
	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            
	            // POST ��û�� ���� �⺻���� false�� setDoOutput�� true�� //07.06 �迬�� : �����Ұ�
	            
	            conn.setRequestMethod("POST");
	            conn.setDoOutput(true);
	            
	            // POST ��û�� �ʿ�� �䱸�ϴ� �Ķ���� ��Ʈ���� ���� ����
	            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	            StringBuilder sb = new StringBuilder();
	            sb.append("grant_type=authorization_code");
	            sb.append("&client_id=ab7da9e9cfc38c18cc1cac5e5ddc71f0");
	            sb.append("&redirect_uri=http://localhost:8090/controller/common/kakaoLogin");
	            sb.append("&code=" + authorize_code);
	            bw.write(sb.toString());
	            bw.flush();
	            
	            // ��� �ڵ尡 200�̶�� ����
	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);
	 
	            //��û�� ���� ���� JSONŸ���� Response �޼��� �о����
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String line = "";
	            String result = "";
	            
	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);
	            
	            // Gson ���̺귯���� ���Ե� Ŭ������ JSON�Ľ� ��ü ����
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
	
	 
	 
	 
	 
	 	//ȸ������ ��û, ����� ���� ���� 
	 	public KakaoVO userInfo(String access_Token) throws IOException {
	 		System.out.println("-------------------------����� ���� ����---------------------------");	 		
	 		//HashMap<String, Object> userInfo = new HashMap<String, Object>();
	 		KakaoVO userInfo = new KakaoVO();
	 		
	 		//��ū�� �̿��Ͽ� īī���� ȸ���� ������ ��û�Ѵ�. // v1�� ���� '����� ���� ��û'�� ����Ǿ���. 
	 		String reqURl = "https://kapi.kakao.com/v2/user/me";
	 		
	 		try {
	 			//URL�� �ڹ� ���ø����̼ǰ� URL����� ������ ��� Ŭ������ ���� Ŭ���� 
	 			//URlconnection�� HttpURLConnection ��� �߻�Ŭ�����μ� �ν��Ͻ��� ���� ���� ������. 
	 			//���� URL��ü�� �����ϴ� ������� �� ������ HttpURLConnection �ν��Ͻ��� ����� �� �ִ�.
	 			URL url = new URL(reqURl);
				HttpURLConnection conn = (HttpURLConnection)url.openConnection();
				conn.setRequestMethod("POST");
				//���� �Ϸ�
				
				//��� �ʵ� �б� 
				//��û�� �ʿ��� Header�� ���� �� ���� // �������� �����ص� ��� 
				conn.setRequestProperty("Authorization", "Bearer " + access_Token);
				
				//�����ڵ� Ȯ���ϱ� 
				int responseCode = conn.getResponseCode();
				System.out.println("responseCode: "+ responseCode);
				
				//�Է½�Ʈ���� ������ ���� ������ �б�
				//inputStream�� �����͸� ����Ʈ�� �迭�� �о� ���� low-level�� �޼���
				//���� �����͸� ���� '������'�� �б� ���ؼ� InputStreamReader�� ����
				//�����͸� ����'��'�� �б� ���ؼ� inputStream�� BufferedReader�� �����ϱ�
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
				
				
				String line="";
				String result ="";
				
				while((line= br.readLine()) != null) {
					result += line;
				}
				System.out.println("response body: " + result);
				
				
				
				// Gson ���̺귯���� ���Ե� Ŭ������ JSON�Ľ� ��ü ����
	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);
	            
	            //System.out.println(element.getAsJsonObject().get("id").getAsLong());
	            //JsonElement.getAsJsonObject().get("key value").getAsŸ��(); �� ���·� �Ľ��Ѵ�. 
	           	//���䵥����(JSON)
	            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	            Long id = element.getAsJsonObject().get("id").getAsLong();
	            
	            //�Ľ̵� json�����͸� string�� ���
	            //properties
	            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	          
	            //kakao_account
	            String email = kakao_account.getAsJsonObject().get("email").getAsString();
	            String gender = kakao_account.getAsJsonObject().get("gender").getAsString();
	            String birthday = kakao_account.getAsJsonObject().get("birthday").getAsString();
	            String age_range = kakao_account.getAsJsonObject().get("age_range").getAsString();
	            
	            System.out.println("id: "+ id);
	            System.out.println("nickname: "+nickname);
	            
	            //setter�̿��Ͽ� KakaoVO�� ��� 
	            userInfo.setKakaoId(id);
	            userInfo.setNickname(nickname);
	            userInfo.setAccount_email(email);
	            userInfo.setAge_range(age_range);
	            userInfo.setGender(gender);
	            userInfo.setBirthday(birthday);
	            
	            //HashMap�� ���
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
	 		System.out.println("----------------------------�α׾ƿ�---------------------------");
	 		//������ ��û�� ��� �ּҿ� ���
	 		String reqURl = "https://kapi.kakao.com/v1/user/logout";
	 		String KakaoAK ="82ee6c3c0d09a5994f67a32f32867738";
	 		
	 		//URL��ü �����ؼ� HttpURLConnection �ν��Ͻ� �����ؼ� �̿��ϱ� 
	 		URL url;
	 		
			try {
				url = new URL(reqURl);
				HttpURLConnection conn = (HttpURLConnection)url.openConnection();
				conn.setRequestMethod("POST");
				//�⺻���� false�̹Ƿ� true�� �ٲ�����Ѵ�.
				conn.setDoOutput(true);
				//H: 
				conn.setRequestProperty("Authorization", "KakaoAK " + KakaoAK);
				conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded ");
				
				
				//d:  POST ��û�� �ʿ�� �䱸�ϴ� �Ķ���� ��Ʈ���� ���� ����
	            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	            StringBuilder sb = new StringBuilder();
	            sb.append("target_id_type=user_id");
	            sb.append("&target_id="+KakaoId);
	            
	            bw.write(sb.toString());
	            bw.flush();
				//���� Ȯ��
				int responseCode = conn.getResponseCode();
				System.out.println("responseCode: "+ responseCode);
				
				
				
				
				//�����Ϳ� �б�	// ������ ���ڵ� 
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
