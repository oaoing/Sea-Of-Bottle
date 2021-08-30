package org.sob.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.transaction.Transactional;

import org.sob.domain.MainVO;
import org.sob.domain.ReplyVO;
import org.sob.domain.UserVO;
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
	public void register(MainVO mvo) {//랜덤 로직 작성중
		log.info("유리병에 편지등록"+mvo);
		List<UserVO> uvoList = mapper.getCustomerNo();
		List<Integer> intList = new ArrayList<>();
		System.out.println("고객번호 리스트"+uvoList);
		int myNo = mvo.getFrom();//내 번호
		for(int i = 0; i<uvoList.size(); i++) {
			int no = uvoList.get(i).getCustomerno();
			if(myNo==no) {
				continue;
			} else {
				intList.add(no);
			}
		}
		System.out.println("본인을 제외한 랜덤풀"+intList);
		Random rand = new Random();
		
		int result = intList.get(rand.nextInt(uvoList.size()-1));
		System.out.println("나온랜덤값"+result);
		mvo.setTo(result);
		
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
	public void registerAdd(MainVO mvo) {//추가글등록
		List<UserVO> uvoList = mapper.getCustomerNo();
		List<Integer> intList = new ArrayList<>();
		System.out.println("고객번호 리스트"+uvoList);
		int myNo = mvo.getFrom();//내 번호
		for(int i = 0; i<uvoList.size(); i++) {
			int no = uvoList.get(i).getCustomerno();
			if(myNo==no) {
				continue;
			} else {
				intList.add(no);
			}
		}
		System.out.println("본인을 제외한 랜덤풀"+intList);
		Random rand = new Random();
		
		int result = intList.get(rand.nextInt(uvoList.size()-1));
		System.out.println("나온랜덤값"+result);
		mvo.setTo(result);
		
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

	@Override
	public int readLast(String labelid) {
		
		return mapper.readLast(labelid);
	}

}
