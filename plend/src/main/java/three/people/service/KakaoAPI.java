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
public class KakaoAPI {

	//��Ʈ�ѷ����� ����� �޼��� ����� 
	//ȭ�鿡�� �Ķ���ͷ� �Ѱ��� code���� �޾ƿ��� POST�� ��û�� ������ ��ū�� �߱޹ޱ� 
	 public String getAccessToken (String authorize_code) {
	     
		 String access_Token = "";
	     String refresh_Token = "";
	       
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
	            
	            System.out.println("access_token : " + access_Token);
	            System.out.println("refresh_token : " + refresh_Token);
	            
	            br.close();
	            bw.close();
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } 
	        
	        return access_Token;
	    }
	
	 
	 
	 
	 
	 	//ȸ������ ��û
	 	public HashMap<String, Object> userInfo(String access_Token) throws IOException {
	 			 		
	 		HashMap<String, Object> userInfo = new HashMap<String, Object>();
	 		
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
	            
	            //JsonElement.getAsJsonObject().get("key value").getAsString(); �� ���·� �Ľ��Ѵ�. 
	           	JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	            
	            //�Ľ̵� json�����͸� string�� ���
	            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	            String email = kakao_account.getAsJsonObject().get("email").getAsString();
	            String gender = kakao_account.getAsJsonObject().get("gender").getAsString();
	            String birthday = kakao_account.getAsJsonObject().get("birthday").getAsString();
	            String age_range = kakao_account.getAsJsonObject().get("age_range").getAsString();
	            
	            
	            //System.out.println("nickname"+nickname);
	            //setter�̿��Ͽ� KakaoVO�� ��� 
	            //userInfo.setNickname(nickname);
	            //userInfo.setAccount_email(email);
	            
	            //HashMap�� ���
	            userInfo.put("nickname", nickname);
	            userInfo.put("email", email);
	            userInfo.put("gender", gender);
	            userInfo.put("birthday", birthday);
	            userInfo.put("age_range", age_range);
	            
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	 		
	 		
	 		
	 		return userInfo;
	 	}
	 	
	 	
	 	
	 	public void kakaoLogout(String access_Token) throws IOException {
	 		//������ ��û�� ��� �ּҿ� ���
	 		String reqURl = "https://kapi.kakao.com/v1/user/logout";
	 		//URL��ü �����ؼ� HttpURLConnection �ν��Ͻ� �����ؼ� �̿��ϱ� 
	 		URL url;
	 		
			try {
				url = new URL(reqURl);
				HttpURLConnection conn = (HttpURLConnection)url.openConnection();
				conn.setRequestMethod("POST");
				conn.setRequestProperty("Authorization", "Bearer" + access_Token);
				
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
