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
		
		if(session.getAttribute("login") != null ) {
				UserVO login = (UserVO) session.getAttribute("login");
				int role = login.getRole();
				System.out.println("role =" + role);
				pw.print("<script>alert('잘못된 접근입니다.');</script>");
				
				pw.flush();
			if(role != 1){
			String urlPrior = request.getRequestURL().toString() + "?" + request.getQueryString();
			request.getSession().setAttribute("url_prior_login", urlPrior);
			
			response.sendRedirect(request.getContextPath() + "/");
			pw.print("<script>alert('잘못된 접근입니다.');</script>");
			
			pw.flush();
			System.out.println("로그인은 했지만 권한이 없음.");
			return false;
			} 
		}else if (session.getAttribute("login") == null) {
			String urlPrior = request.getRequestURL().toString() + "?" + request.getQueryString();
			request.getSession().setAttribute("url_prior_login", urlPrior);
			
			response.sendRedirect(request.getContextPath() + "/");	
			pw.print("<script>alert('잘못된 접근입니다.');</script>");
			
			pw.flush();
			System.out.println("로그인 하지 않음.");
			return false;
		} else {
			return true;
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
