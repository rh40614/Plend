package three.people.service;

import three.people.vo.SearchVO;

public interface SearchService {
	
	SearchVO setPageCntPerPage(SearchVO searchVO, int cntPerPage);
	SearchVO setPageCntPerPage(SearchVO searchVO, int cntPerPage, int role);

}
