package three.people.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import three.people.service.KakaoAPI;
import three.people.vo.KakaoVO;


@RequestMapping(value="/common")
@Controller
public class CommonController {
	
	// ���� ��ü���� �ޱ�
	@Autowired 
    private KakaoAPI kakaoService;

	//�ּ�â�� �ִ� code �Ķ���� �� �����ͼ� ��ū�߱޹ޱ�
	@RequestMapping(value="/kakaoLogin")
	public String login(@RequestParam("code") String code , HttpServletRequest request, HttpSession session) throws IOException {
		
		//��ū �߱�
		String access_Token = kakaoService.getAccessToken(code);
		
		//����� ���� ��������
		//HashMap<String, Object> userInfo = kakaoService.userInfo(access_Token);
		KakaoVO userInfo = kakaoService.userInfo(access_Token);
		
		
		session = request.getSession();
		
		System.out.println("accessToken: "+access_Token);
		System.out.println("code:"+ code);
		System.out.println("Common Controller:"+ userInfo);
		System.out.println("�г���: "+ userInfo.getNickname());
		System.out.println("�̸���: "+ userInfo.getAccount_email());
		System.out.println("����: "+ userInfo.getGender());
		
		
		//Ŭ���̾�Ʈ�� �г����� �����ϸ� ���ǿ� �г��Ӱ� ��ū ���
		if (userInfo.getNickname() != null) {
		     session.setAttribute("nickname", userInfo.getNickname());
		     session.setAttribute("access_Token", access_Token);
		     session.setAttribute("kakaoId", userInfo.getKakaoId());
		   }
		
		
		return "common/kakao";
	}
	
	
	
	//�α׾ƿ�
	@RequestMapping(value="/logout")
	public String logout(HttpSession session ) throws IOException {
		//ȸ�� ���̵� ��������� - �̷����ϸ� ������ ���°� �ƴ϶� ���� ����� �Ǵ� ��
		//KakaoVO id = new KakaoVO();
		//Long KakaoId = id.getKakaoId();
		
		//System.out.println(session.getAttribute("access_Token"));
		//System.out.println(KakaoId);
		
		//����� ������ ���� ���ǿ� id�� ���(�Ѱ��ֱ� ����)
		Long kakaoId = (Long)session.getAttribute("kakaoId");
		
		//�α׾ƿ�
		kakaoService.logout((String)session.getAttribute("access_Token"), kakaoId);
		session.removeAttribute("access_Token");
		session.removeAttribute("nickname");
		session.removeAttribute("kakaoId");
				
		return "redirect:/";
	}
	
	
	
}
