package three.people.service;

import java.io.IOException;
import java.util.Base64;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import three.people.vo.SnsProfileVO;
import three.people.vo.SnsVO;

@Service
public class GoogleService implements SnsService{

	@Override
	public SnsVO getAccessToken(SnsVO snsVO) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	@Override
	public SnsProfileVO getUserProfile(SnsVO snsVO) throws IOException {
		
		String[] chunks = snsVO.getCredential().split("\\.");
		
		Base64.Decoder decoder = Base64.getUrlDecoder();
		String header = new String (decoder.decode(chunks[0]),"UTF-8");
		String payload = new String (decoder.decode(chunks[1]),"UTF-8");
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
		SnsProfileVO snsProfile = mapper.readValue(payload, SnsProfileVO.class);
		return snsProfile;
	}


	@Override
	public void userSignOut(SnsVO snsVO) {
		// TODO Auto-generated method stub
		
	}

}
