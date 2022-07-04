package three.people.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import three.people.api.ApiExamMemberProfile;
import three.people.vo.NaverVO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="test.do")
	public String test() {
		return "test";
	}

	@RequestMapping(value="testGet.do")
	public String testGet(){
		return "redirect:http://www.naver.com";
	}
	
	@RequestMapping(value="callback.do")
	public String callback(NaverVO navervo, Model model, HttpServletRequest request) throws UnsupportedEncodingException {
		/*
		 * System.out.println("navervo.getAccess_token()" +navervo.getAccess_token());
		 * System.out.println("navervo.getClient_id()"+navervo.getClient_id());
		 * System.out.println("navervo.getClient_secret()"+navervo.getClient_secret());
		 * System.out.println("navervo.getCode()"+navervo.getCode());
		 * System.out.println("navervo.getGrant_type()"+navervo.getGrant_type());
		 * System.out.println("navervo.getRefresh_token()"+navervo.getRefresh_token());
		 * System.out.println("navervo.getState()"+navervo.getState());
		 */
	    String clientId = "yuDMbMbNqBLt1ltRxtOG";//���ø����̼� Ŭ���̾�Ʈ ���̵�";
	    String clientSecret = "xCVm9skXrf";//���ø����̼� Ŭ���̾�Ʈ ��ũ����";
	    String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    String redirectURI = URLEncoder.encode("http://localhost:8090/controller/callback.do", "UTF-8");
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    String access_token = "";
	    String refresh_token = "";
	    System.out.println("apiURL="+apiURL);
	    try {
	      URL url = new URL(apiURL);
	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
	      con.setRequestMethod("GET");
		
	      int responseCode = con.getResponseCode();
	      BufferedReader br;
	      System.out.print("responseCode="+responseCode);
	      if(responseCode==200) { // ���� ȣ��
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // ���� �߻�
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }
	      String inputLine;
	      StringBuffer res = new StringBuffer();
	      while ((inputLine = br.readLine()) != null) {
	    	System.out.println("inputLine : "+inputLine);
	    	ObjectMapper mapper = new ObjectMapper();
		    navervo = mapper.readValue(inputLine, NaverVO.class);
		    System.out.println("navervo.getAccess_token()" +navervo.getAccess_token());
	        res.append(inputLine);
	      }
	      br.close();
	      if(responseCode==200) {
	    	  System.out.println(res.toString());
	      }
	    } catch (Exception e) {
	      System.out.println(e);
	    }
	    
		return "callback";
	}

	/*
	 * @RequestMapping(value="callback.do") public String callback(Model model,
	 * HttpServletRequest request) { ApiExamMemberProfile amp = new
	 * ApiExamMemberProfile();
	 * System.out.println(request.getParameter("access_token"));
	 * 
	 * // amp.main(access_token); model.addAttribute("model", model); return
	 * "callback"; }
	 */
	
}
