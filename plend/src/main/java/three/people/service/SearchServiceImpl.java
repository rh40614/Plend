package three.people.service;

import org.springframework.stereotype.Service;

import three.people.vo.SearchVO;

@Service
public class SearchServiceImpl implements SearchService {

	@Override
	public SearchVO setPageCntPerPage(SearchVO searchVO, int cntPerPage) {
		if(searchVO.getNowPage() == 0 && searchVO.getCntPerPage() == 0) {
			searchVO.setNowPage(1);
			searchVO.setCntPerPage(cntPerPage);
		}else if(searchVO.getCntPerPage() == 0) {
			searchVO.setCntPerPage(cntPerPage);
		}else if(searchVO.getNowPage() == 0) {
			searchVO.setNowPage(1);
		}
		return searchVO;
	}

	@Override
	public SearchVO setPageCntPerPage(SearchVO searchVO, int cntPerPage, int role) {
		if(searchVO.getNowPage() == 0 && searchVO.getCntPerPage() == 0) {
			searchVO.setNowPage(1);
			searchVO.setCntPerPage(cntPerPage);
		}else if(searchVO.getCntPerPage() == 0) {
			searchVO.setCntPerPage(cntPerPage);
		}else if(searchVO.getNowPage() == 0) {
			searchVO.setNowPage(1);
		}
		
		searchVO.setRole(role);
		return searchVO;
	}
	
}
