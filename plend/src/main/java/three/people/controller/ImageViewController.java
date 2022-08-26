package three.people.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import three.people.vo.ImageVO;

@Controller
public class ImageViewController {
	
	@RequestMapping(value="/imageView.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> getFile(ImageVO imagevo, HttpServletRequest request, HttpSession session){
		
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/placeImg");
		File file=new File(path, imagevo.getRealFileName());
	    ResponseEntity<byte[]> result=null;
	    try {
	        HttpHeaders headers=new HttpHeaders();
	        headers.add("Content-Type", Files.probeContentType(file.toPath()));
	        result=new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),headers,HttpStatus.OK );
	    }catch (IOException e) {
	        e.printStackTrace();
	    }
	    return result;
	}
	
	@RequestMapping(value="/reviewImg.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> reviewImg(ImageVO imagevo, HttpServletRequest request, HttpSession session){
		
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/reviewImg");
		File file=new File(path, imagevo.getRealFileName());
	    ResponseEntity<byte[]> result=null;
	    try {
	        HttpHeaders headers=new HttpHeaders();
	        headers.add("Content-Type", Files.probeContentType(file.toPath()));
	        result=new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),headers,HttpStatus.OK );
	    }catch (IOException e) {
	        e.printStackTrace();
	    }
	    return result;
	}
	
	@RequestMapping(value="/eventImg.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> eventImg(ImageVO imagevo, HttpServletRequest request, HttpSession session){
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/eventImg");
		File file=new File(path, imagevo.getRealFileName());
	    ResponseEntity<byte[]> result=null;
	    try {
	        HttpHeaders headers=new HttpHeaders();
	        headers.add("Content-Type", Files.probeContentType(file.toPath()));
	        result=new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),headers,HttpStatus.OK );
	    }catch (IOException e) {
	        e.printStackTrace();
	    }
	    //System.out.println(path);
	    return result;
	}
	
	
	@RequestMapping(value="/noticeImg.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> noticeImg(ImageVO imagevo, HttpServletRequest request, HttpSession session){
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/eventImg");
		File file=new File(path, imagevo.getRealFileName());
	    ResponseEntity<byte[]> result=null;
	    try {
	        HttpHeaders headers=new HttpHeaders();
	        headers.add("Content-Type", Files.probeContentType(file.toPath()));
	        result=new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),headers,HttpStatus.OK );
	    }catch (IOException e) {
	        e.printStackTrace();
	    }
	    //System.out.println(path);
	    return result;
	}
}
