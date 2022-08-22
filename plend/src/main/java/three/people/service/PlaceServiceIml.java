package three.people.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
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
		return placeDAO.eventPlace(userVO);
	}

	
	@Override
	public int[] RandomPlace(List<PlaceVO> methodList) {
		
		
		int listSize = methodList.size();
		
		Random random = new Random();
		//인덱스 값을 담을 배열 생성 9개 이상
		int[] idx = new int[9];
		//객체가 9개이하 6개 이상일 경우 
		int[] idxOver6 = new int[6];
		//객체가 3개 이상 6개 이하일 경우 
		int[] idxOver3 = new int[6];
		
		
		
		if(listSize <6) {
			//1. 랜덤으로 뽑아낼 리스트에 객체가 3개 이상  6개 이하일 경우 
			for(int i=0; i<idxOver3.length; i++) {
				
				if(i!=0) {
					boolean flag = true;
					while(flag) {
						int randomNum = random.nextInt(listSize);
						boolean checkSame = false;
						for(int j=0; j<i; j++) {
							if(idxOver3[j]==randomNum) {
								checkSame = true;	 
								break;
							}
						}
						if(!checkSame) {
							idxOver3[i] = randomNum;
							flag = false;
						}
					}
				}else {
					int randomNum = random.nextInt(listSize);
					idxOver3[i] = randomNum;
				}
			}
			return idxOver3;
			
		}else if(listSize<9) {
			
			//2. 랜덤으로 뽑아낼 리스트에 객체가 6개 이상  9개 이하일 경우 
			for(int i=0; i<idxOver6.length; i++) {
				
				if(i!=0) {
					boolean flag = true;
					while(flag) {
						int randomNum = random.nextInt(listSize);
						boolean checkSame = false;
						for(int j=0; j<i; j++) {
							if(idxOver6[j]==randomNum) {
								checkSame = true;	 
								break;
							}
						}
						if(!checkSame) {
							idxOver6[i] = randomNum;
							flag = false;
						}
					}
				}else {
					int randomNum = random.nextInt(listSize);
					idxOver6[i] = randomNum;
				}
			}
			
			return idxOver6;
			
		}else if(listSize > 0) {
			
			//3. 랜덤으로 뽑아낼 리스트에 객체가 9개 이상일 경우 
			for(int i=0; i<idx.length; i++) {
				
				if(i!=0) {
					boolean flag = true;
					while(flag) {
						//새로운 수 생성 
						int randomNum = random.nextInt(listSize);
						//기존의 배열에 새로 넣으려고 하는  randomNum이 있는지 비교
						boolean checkSame = false;
						for(int j=0; j<i; j++) {
							if(idx[j]==randomNum) {
								//이미 같은 값이 존재한다면 for문 나가서 while문 부터 다시 돌기
								checkSame = true;	 
								break;
							}
						}
						//기존의 배열에 존재하지 않는 값이면 위의 for문을 나와서 아래의 if문을 탄다.배열에 그 값을 넣고 다시 첫번째 for 문으로 가기 
						//NOTE: 조건문은 조건식이 true일때 돈다. 따라서 checkSame이 현재 false이고 조건식은  (!false)가 되므로(true)이다. 따라서 if의 조건식이 true가 되므로 실행문을 타게된다.   
						if(!checkSame) {
							idx[i] = randomNum;
							flag = false;
						}
					}
				//첫번째 값은 무조건 넣기 (i=0)	
				}else {
					int randomNum = random.nextInt(listSize);
					idx[i] = randomNum;
				}
			}
			return idx;
		}else {
			int[] nothing =new int[1];
			return nothing;
		}
			
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
		return placeDAO.searchPlace(search);
	}
	@Override
	public int countHeart(PlaceVO placeVO) {
		return placeDAO.countHeart(placeVO);
	}
	@Override
	public List<PlaceVO> hashList(String[] tag) {
		return placeDAO.hashList(tag);
	}
	
}
