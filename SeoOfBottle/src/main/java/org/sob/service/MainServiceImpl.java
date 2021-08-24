package org.sob.service;

import java.util.List;

import org.sob.domain.MainVO;
import org.sob.mapper.MainMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MainServiceImpl implements MainService {
	private MainMapper mapper;
	
	@Override
	public void register(MainVO mvo) {
		log.info("유리병 바다에 던지기"+mvo);
		mapper.insert(mvo);

	}

	@Override
	public List<MainVO> get(String groupId) {
		log.info("편지읽기"+groupId);
		return mapper.read(groupId);
	}

	@Override
	public boolean remove(String groupId) {
		log.info("유리병버리기"+groupId);
		return mapper.delete(groupId)==1;
	}

	@Override
	public List<MainVO> getList(int cno) {
		log.info("밀려들어온 유리병들 목록");
		return mapper.getList(cno);
	}

	@Override
	public List<MainVO> getCategoryList() {
		
		return mapper.getCategoryList();
	}

}
