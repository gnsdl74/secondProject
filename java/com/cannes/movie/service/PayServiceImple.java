package com.cannes.movie.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cannes.movie.domain.PayVO;
import com.cannes.movie.persistance.PayDAO;

@Service
public class PayServiceImple implements PayService {
	private static final Logger logger = LoggerFactory.getLogger(PayServiceImple.class);
	
	@Autowired
	private PayDAO payDao;
	
	@Override
	public List<PayVO> readAll() {
		logger.info("readAll() 호출"); 
		return payDao.paySelectAll();
	} // end readAll()

	@Override
	public int create(PayVO vo) {
		logger.info("create() 호출");
		return payDao.payInsert(vo);
	} // end create()

	@Override
	public List<PayVO> readByMember(int memberNo) {
		logger.info("readByMember() 호출");
		return payDao.paySelectByMember(memberNo);
	} // end readByMember()

	@Override
	public PayVO readDetail(int payNo) {
		logger.info("readDetail() 호출");
		return payDao.paySelectByPayNo(payNo);
	} // end readDetail()

	@Override
	public int delete(int payNo) {
		logger.info("delete() 호출");
		return payDao.payDelete(payNo);
	} // end delete()

} // end PayServiceImple
