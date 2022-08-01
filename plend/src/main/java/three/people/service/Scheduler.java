package three.people.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {
	
	@Autowired
	BookService bookService;
	
	//	1시간마다 예약확인하여 이용시간 지난 예약 완료처리하기
	@Scheduled(cron = "0 0 0-23 * * *")
	public void autoUpdate() {
		bookService.updateSuccess();
	}
}
