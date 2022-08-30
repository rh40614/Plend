package three.people.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import three.people.dao.PlaceDAO;
import three.people.vo.BookVO;
import three.people.vo.EventVO;
import three.people.vo.HeartVO;
import three.people.vo.ImageVO;
import three.people.vo.PlaceVO;
import three.people.vo.QnaVO;
import three.people.vo.SearchVO;
import three.people.vo.UserVO;

@Service
public class PlaceServiceIml implements PlaceService{

	@Autowired
	PlaceDAO placeDAO;
	
	@Override
	public List<PlaceVO> selectPlaceAll(HashMap<String, Object> page) {
		List<PlaceVO> result = placeDAO.selectPlaceAll(page);
		
		//장소 소개 35자 이상 자르기
		for(PlaceVO place: result) {
			if(place.getPlaceDetail().length() > 90) {
				String pd =place.getPlaceDetail().substring(0, 90);
				place.setPlaceDetail(pd);
			}
		}
		return result;
	}

	@Override
	public int cntPlace(PlaceVO placeVO) {
		int result = placeDAO.cntPlace(placeVO);
		return result;
	}

	@Override
	public PlaceVO placeOne(PlaceVO placevo) {
		return placeDAO.placeOne(placevo);
	}

	@Override
	public int insertQnA(QnaVO qnavo) {
		return placeDAO.insertQnA(qnavo);
	}

	@Override
	public List<QnaVO> selectQnA(PlaceVO placevo) {
		return placeDAO.selectQnA(placevo);
	}

	@Override
	public int qnaModify(QnaVO qnavo) {
		return placeDAO.qnaModify(qnavo);
	}

	@Override
	public int deleteQnA(QnaVO qnavo) {
		return placeDAO.deleteQnA(qnavo);
	}

	@Override
	public List<ImageVO> selectImage(PlaceVO placevo) {
		return placeDAO.selectImage(placevo);
	}

	@Override
	public List<PlaceVO> categoryPlace(PlaceVO placeVO) {
		List<PlaceVO> result = placeDAO.categoryPlace(placeVO);
		//장소 이름 자르기
		for(PlaceVO place: result) {
			//단일 공백 정규식 : \\s
			String[] ad = place.getAddress().split("\\s");
			String twoFromStart = ad[0] +" " +ad[1];
			//System.out.println("twoFromStart: "+twoFromStart);
			
			place.setAddress(twoFromStart);
		}
		
		return result;
	}

	@Override
	public ImageVO selectImageOne(PlaceVO placeVO) {
		return placeDAO.selectImageOne(placeVO);
	}

	@Override
	public List<PlaceVO> selectPlace(UserVO userVO) {
		List<PlaceVO> result = placeDAO.selectPlace(userVO);
		//장소 이름 자르기
		for(PlaceVO place: result) {
			//단일 공백 정규식 : \\s
			String[] ad = place.getAddress().split("\\s");
			String twoFromStart = ad[0] +" " +ad[1];
			place.setAddress(twoFromStart);
		}
		return result;
	}
	
	@Override
	public int likeAdd(HeartVO heartvo) {
		return placeDAO.likeAdd(heartvo);
	}

	@Override
	public int likeDelete(HeartVO heartvo) {
		return placeDAO.likeDelete(heartvo);
	}

	@Override
	public List<HeartVO> selectHeart(HeartVO heartvo) {
		return placeDAO.selectHeart(heartvo);
	}

	@Override
	public List<PlaceVO> eventPlace(UserVO userVO) {
		List<PlaceVO> result = placeDAO.eventPlace(userVO);
		for(PlaceVO place: result) {
			//단일 공백 정규식 : \\s
			String[] ad = place.getAddress().split("\\s");
			String twoFromStart = ad[0] +" " +ad[1];
			
			place.setAddress(twoFromStart);
		}
		return result;
	}

	
	@Override
	public int[] RandomPlace(List<PlaceVO> methodList) {
		int listSize = methodList.size();
		int[] idx = new int[9];

		if(listSize <6) {
			return idx = removeSameItems(idx,listSize);
		}else if(listSize<9) {
			return idx = removeSameItems(idx,listSize);
		}else if(listSize > 0) {
			return idx = removeSameItems(idx,listSize);
		}else {
			int[] nothing =new int[1];
			return nothing;
		}
			
	}

	//랜덤 플레이스 로직 분리
	public int[] removeSameItems(int[] idxOverN, int listSize) {
		Random random = new Random();
		for(int i=0; i<idxOverN.length; i++) {
			if(i!=0) {
				boolean flag = true;
				while(flag) {
					int randomNum = random.nextInt(listSize);
					boolean checkSame = false;
					for(int j=0; j<i; j++) {
						if(idxOverN[j]==randomNum) {
							checkSame = true;	 
							break;
						}
					}
					if(!checkSame) {
						idxOverN[i] = randomNum;
						flag = false;
					}
				}
			}else {
				int randomNum = random.nextInt(listSize);
				idxOverN[i] = randomNum;
			}
		}
		return idxOverN;
	}
	

	
	
	
	//검색 인원, 지역
	@Override
	public List<PlaceVO> filter_search(PlaceVO placeVO) {
		
		List<PlaceVO> result = placeDAO.filter_search(placeVO);
		
		//장소 이름 자르기
		for(PlaceVO place: result) {
			//단일 공백 정규식 : \\s
			String[] ad = place.getAddress().split("\\s");
			String twoFromStart = ad[0] +" " +ad[1];
			//System.out.println("twoFromStart: "+twoFromStart);
			
			place.setAddress(twoFromStart);
		}
		
		return result;
	}

	@Override
	public int deletePlace(PlaceVO placeVO) {
		return placeDAO.deletePlace(placeVO);
	}
	@Override
	public List<PlaceVO> searchPlace(HashMap<String, Object> search) {
		List<PlaceVO> result = placeDAO.searchPlace(search);
		for(PlaceVO place: result) {
			String[] ad = place.getAddress().split("\\s");
			String twoFromStart = ad[0] +" " +ad[1];
			place.setAddress(twoFromStart);
			}
		return result;
	}
	@Override
	public int countHeart(PlaceVO placeVO) {
		return placeDAO.countHeart(placeVO);
	}
	@Override
	public List<PlaceVO> hashList(String[] array) {
		 List<PlaceVO> list = placeDAO.hashList(array);
		 for(PlaceVO place: list){
			
			String[] ad = place.getAddress().split("\\s");
			String twoFromStart = ad[0] +" " +ad[1];
			place.setAddress(twoFromStart);
		 }
		
		 return list;
	}
	
}
