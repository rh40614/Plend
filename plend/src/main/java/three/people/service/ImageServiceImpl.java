package three.people.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import three.people.vo.EventVO;
import three.people.vo.ImageVO;
import three.people.vo.PlaceVO;
import three.people.vo.ReviewVO;

@Service
public class ImageServiceImpl {
	
	@Autowired
	HostService hostService;
	@Autowired
	AdminService adminService;
	@Autowired
	ReviewService reviewService;
	
	//장소 사진 저장
	public int savePlaceImage(HttpServletRequest request, PlaceVO placeVO) throws IllegalStateException, IOException {
		//반환할 사진 객체
		ImageVO imageVO = new ImageVO();
		int result_img = 0;
		//사진이 저장될 경로
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/placeImg");
		System.out.println(path);
		File dir = new File(path);
		if(!dir.exists()) {	//위치가 존재하는지 확인
			 dir.mkdirs();	//위치가 존재하지 않는경우 위치를 생성
		}
				
		for(MultipartFile files : placeVO.getPlaceImgs()) {
					
			if(!files.getOriginalFilename().isEmpty()) {	//화면에서 넘어온 파일이 존재한다면
				
				//originName(사용자가 저장한 이름) 가지고 오기
				String originFileName = files.getOriginalFilename();
				//확장자 추출(이후 호출 할때 확장자가 두번 붙어버림) 
				String extention = originFileName.substring(originFileName.lastIndexOf("."));
				//확장자를 제거한 파일 이름
				String origin = originFileName.replace(extention, "");
				
				Date now =new Date();
				SimpleDateFormat simple = new SimpleDateFormat("SSS");
				String distinct = simple.format(now);
				
				//서버에 저장될 이름(사진이름SSS.확장자)
				String realFileName = origin + distinct+ extention ;
				System.out.println("realFileName: "+realFileName);
				
				//화면에서 넘어온 파일을 path위치에 새로쓰는 로직//error는 throw	
				files.transferTo(new File(path, realFileName));	
				
				imageVO.setPidx(placeVO.getPidx());
				imageVO.setPath(path);
				imageVO.setOriginFileName(originFileName);
				imageVO.setRealFileName(realFileName);
			
				//사진 디비에 저장
				result_img = hostService.insertPlaceImg(imageVO);
			}else {
				System.out.println("업로드할 파일이 존재하지 않습니다.");
			}
		}
		return result_img;
	}
	
	//장소 사진 수정
	public void editPlaceImage(HttpServletRequest request, PlaceVO placeVO) throws IllegalStateException, IOException {
	
		// 기존 사진 삭제
		hostService.deletePlaceImg(placeVO);
		//사진이 저장될 경로
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/placeImg");
				
		System.out.println(path);
		File dir = new File(path);
		if(!dir.exists()) {	//위치가 존재하는지 확인
			 dir.mkdirs();	//위치가 존재하지 않는경우 위치를 생성
		}
				
		for(MultipartFile files : placeVO.getPlaceImgs()) {
					
			if(!files.getOriginalFilename().isEmpty()) {	//화면에서 넘어온 파일이 존재한다면
				
				//originName(사용자가 저장한 이름) 가지고 오기
				String originFileName = files.getOriginalFilename();
				
				//확장자 추출(이후 호출 할때 확장자가 두번 붙어버림) 
				String extention = originFileName.substring(originFileName.lastIndexOf("."));
				//확장자를 제거한 파일 이름
				String origin = originFileName.replace(extention, "");
				
				Date now =new Date();
				SimpleDateFormat simple = new SimpleDateFormat("SSS");
				String distinct = simple.format(now);
				
				//서버에 저장될 이름(사진이름SSS.확장자)
				String realFileName = origin + distinct+ extention ;
				System.out.println("realFileName: "+realFileName);
				//화면에서 넘어온 파일을 path위치에 새로쓰는 로직
				files.transferTo(new File(path, realFileName));	//error는 throw	
				
				ImageVO imageVO = new ImageVO();
				
				imageVO.setPidx(placeVO.getPidx());
				imageVO.setPath(path);
				imageVO.setOriginFileName(originFileName);
				imageVO.setRealFileName(realFileName);
				
				 int result_img = hostService.insertPlaceImg(imageVO);
				 
				 	if(result_img == 1) {
				 		System.out.println("이미지 등록 성공");
					 
				 	}else {
				 		System.out.println("이미지 등록 실패");
				 	}
				}else {
					System.out.println("업로드할 파일이 존재하지 않습니다.");
				}
			}
		
	
	
	
	}
	//이벤트 이미지 등록
	public void saveEventImage(EventVO eventvo, HttpServletRequest request) throws IllegalStateException, IOException {
		
		if(eventvo.getStartEnd().equals("start")) {
			adminService.placeEventUpdate(eventvo);
		}
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/eventImg");
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		for(MultipartFile files : eventvo.getEventImg()) {
			
			if(!files.getOriginalFilename().isEmpty()) {	
				//화면에서 넘어온 파일이 존재한다면
				String originFileName = files.getOriginalFilename();
				String extention = originFileName.substring(originFileName.lastIndexOf("."));
				String origin = originFileName.replace(extention, "");
				
				Date now =new Date();
				SimpleDateFormat simple = new SimpleDateFormat("SSS");
				String distinct = simple.format(now);
				
				//서버에 저장될 이름(사진이름SSS.확장자)
				String realFileName = origin + distinct+ extention ;
				System.out.println("realFileName: "+realFileName);
				//화면에서 넘어온 파일을 path위치에 새로쓰는 로직
				files.transferTo(new File(path, realFileName));	//error는 throw	
				ImageVO imageVO = new ImageVO();
				
				imageVO.setEidx(eventvo.getEidx());
				imageVO.setPath(path);
				imageVO.setOriginFileName(originFileName);
				imageVO.setRealFileName(realFileName);
				
				adminService.eventImg(imageVO);
			}
		}
	}
	
	//이벤트 이미지 수정
	public void editEventImage(EventVO eventvo, HttpServletRequest request) throws IllegalStateException, IOException {
		
		if(eventvo.getStartEnd().equals("start")) {
			adminService.placeEventUpdate(eventvo);
		}else {
			adminService.placeEventDone(eventvo);
		}
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/eventImg");
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		ImageVO img = new ImageVO();
		img.setEidx(eventvo.getEidx());
		adminService.deleteEventImg(img);
		for(MultipartFile files : eventvo.getEventImg()) {
			
			if(!files.getOriginalFilename().isEmpty()) {	
				//화면에서 넘어온 파일이 존재한다면
				String originFileName = files.getOriginalFilename();
				String extention = originFileName.substring(originFileName.lastIndexOf("."));
				String origin = originFileName.replace(extention, "");
				
				Date now =new Date();
				SimpleDateFormat simple = new SimpleDateFormat("SSS");
				String distinct = simple.format(now);
				
				//서버에 저장될 이름(사진이름SSS.확장자)
				String realFileName = origin + distinct+ extention ;
				System.out.println("realFileName: "+realFileName);
				//화면에서 넘어온 파일을 path위치에 새로쓰는 로직
				files.transferTo(new File(path, realFileName));	//error는 throw	
				ImageVO imageVO = new ImageVO();
				
				imageVO.setEidx(eventvo.getEidx());
				imageVO.setPath(path);
				imageVO.setOriginFileName(originFileName);
				imageVO.setRealFileName(realFileName);
				
				adminService.eventImg(imageVO);
				
			}
		}
	}
	
	
	
	//리뷰 이미지 등록
	public void saveReviewImage(ReviewVO reviewVO, HttpServletRequest request) throws IllegalStateException, IOException {
	
		//사진이 저장될 경로
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/reviewImg");
				
		System.out.println(path);
		File dir = new File(path);
		if(!dir.exists()) {	//위치가 존재하는지 확인
			 dir.mkdirs();	//위치가 존재하지 않는경우 위치를 생성
		}
				
		for(MultipartFile files : reviewVO.getReviewImgs()) {
					
			if(!files.getOriginalFilename().isEmpty()) {	//화면에서 넘어온 파일이 존재한다면
				//originName(사용자가 저장한 이름) 가지고 오기
				String originFileName = files.getOriginalFilename();
				
				//확장자 추출(이후 호출 할때 확장자가 두번 붙어버림) 
				String extention = originFileName.substring(originFileName.lastIndexOf("."));
				//확장자를 제거한 파일 이름
				String origin = originFileName.replace(extention, "");
				
				Date now =new Date();
				SimpleDateFormat simple = new SimpleDateFormat("SSS");
				String distinct = simple.format(now);
				
				//서버에 저장될 이름(사진이름SSS.확장자)
				String realFileName = origin + distinct+ extention ;
				System.out.println("realFileName: "+realFileName);
				
				//화면에서 넘어온 파일을 path위치에 새로쓰는 로직
				files.transferTo(new File(path, realFileName));	//error는 throw	
				
				ImageVO imageVO = new ImageVO();
				
				imageVO.setRvidx(reviewVO.getRvidx());
				imageVO.setPath(path);
				imageVO.setOriginFileName(originFileName);
				imageVO.setRealFileName(realFileName);
				
				reviewService.insertReviewImg(imageVO);
			}
		}
	}	
		
	
	
	
	//리뷰 이미지 수정
	public void editReviewImage(ReviewVO reviewVO, HttpServletRequest request) throws IllegalStateException, IOException {
		//사진이 저장될 경로
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/reviewImg");
				
		System.out.println(path);
		File dir = new File(path);
		if(!dir.exists()) {	//위치가 존재하는지 확인
			 dir.mkdirs();	//위치가 존재하지 않는경우 위치를 생성
		}
		if(reviewVO.getDeleteImg() != null) {
			String[] imgs = reviewVO.getDeleteImg().split("/");
			for(String img : imgs) {
				ImageVO imageVO = new ImageVO();
				imageVO.setRvidx(reviewVO.getRvidx());
				imageVO.setOriginFileName(img);
				
				reviewService.reviewImgModify(imageVO);
			}
		}
		for(MultipartFile files : reviewVO.getReviewImgs()) {
			if(!files.getOriginalFilename().isEmpty()) {	//화면에서 넘어온 파일이 존재한다면
				
				//originName(사용자가 저장한 이름) 가지고 오기
				String originFileName = files.getOriginalFilename();
				
				//확장자 추출(이후 호출 할때 확장자가 두번 붙어버림) 
				String extention = originFileName.substring(originFileName.lastIndexOf("."));
				//확장자를 제거한 파일 이름
				String origin = originFileName.replace(extention, "");
				
				Date now =new Date();
				SimpleDateFormat simple = new SimpleDateFormat("SSS");
				String distinct = simple.format(now);
				
				//서버에 저장될 이름(사진이름SSS.확장자)
				String realFileName = origin + distinct+ extention ;
				System.out.println("realFileName: "+realFileName);
				//화면에서 넘어온 파일을 path위치에 새로쓰는 로직
				files.transferTo(new File(path, realFileName));	//error는 throw	
				
				ImageVO imageVO = new ImageVO();
				
				imageVO.setRvidx(reviewVO.getRvidx());
				imageVO.setPath(path);
				imageVO.setOriginFileName(originFileName);
				imageVO.setRealFileName(realFileName);
				
				reviewService.insertReviewImg(imageVO);
			}
		}
	
	}	
	
	
	
	
	
	
	
	
	

}
