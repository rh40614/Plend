package three.people.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import three.people.vo.UserVO;

public class Interceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		
		UserVO login = (UserVO) session.getAttribute("login");
		
				
		if(session.getAttribute("login") != null ) {
				int role = login.getRole();
				System.out.println("role =" + role);
			if(role != 1){
			pw.print("<script>alert('잘못된 접근입니다.');location.href = '/controller/'</script>");
			
			pw.flush();
			System.out.println("로그인은 했지만 권한이 없음.");
			return false;
			} 
		}else if(session.getAttribute("login") == null) {
			
			System.out.println("로그인 하지 않음.");
			pw.print("<script>alert('로그인이 필요한 접근입니다.');location.href = '/controller/common/signIn.do'</script>");
			
			pw.flush();
			
			return false;
		}
			return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		 System.out.println("postHandle1");
	        System.out.println("[ModelAndView][ model 이름 : " + modelAndView.getViewName() + "][ model 내용 :" + modelAndView.getModel() + "]" );
		
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		
	}

}
