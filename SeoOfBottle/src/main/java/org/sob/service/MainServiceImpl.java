package org.sob.service;

import java.util.List;

import javax.transaction.Transactional;

import org.sob.domain.MainVO;
import org.sob.domain.ReplyVO;
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
	@Transactional
	public void register(MainVO mvo) {//랜덤 로직 필요
		log.info("유리병에 편지등록"+mvo);
		mapper.bottleInsert(mvo);
		mvo.setLabelid(mapper.selectLabelid());
		mapper.letterInsert(mvo);
		mapper.receivertableInsert(mvo);
		mapper.boastInsert(mvo);

	}

	@Override
	public List<MainVO> get(String labelid) {
		log.info("편지읽기"+labelid);
		return mapper.read(labelid);
	}
	
	
	@Override
	public boolean remove(String labelid) {
		log.info("내목록에서 삭제"+labelid);
		return mapper.deleteBottle(labelid)==1;
	}
	
	
	
	

	@Override
	public List<MainVO> getList(int customerNo) {
		log.info("밀려들어온 유리병들 목록");
		return mapper.getList(customerNo);
	}

	@Override
	public List<MainVO> getCategoryList() {
		
		return mapper.getCategoryList();
	}

	

	

	@Override
	public List<MainVO> getBoastList() {
		
		return mapper.getBoastList();
	}

	@Override
	public List<MainVO> getMyBoastList(int customerNo) {
		
		return mapper.getMyBoastList(customerNo);
	}

	@Override
	public boolean remove2(MainVO mvo) {
		
		return mapper.deleteReceiver(mvo)==1;
	}

	@Override
	@Transactional
	public void registerAdd(MainVO mvo) {
		mapper.letterInsert(mvo);
		mapper.receivertableInsert(mvo);
	}

	@Override
	public void updateBoast(MainVO mvo) {
		mapper.updateBoast(mvo);
		
	}

	@Override
	public List<MainVO> getListUseCategory(MainVO mvo) {
		
		return mapper.getListUseCategory(mvo);
	}

	@Override
	public List<MainVO> getBoastListUseCategory(int categoryid) {
		
		return mapper.getBoastListUseCategory(categoryid);
	}

	@Override
	public List<MainVO> getMyBoastListUseCategory(MainVO mvo) {
		
		return mapper.getMyBoastListUseCategory(mvo);
	}

}
