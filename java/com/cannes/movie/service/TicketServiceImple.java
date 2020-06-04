package com.cannes.movie.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cannes.movie.domain.TicketVO;
import com.cannes.movie.persistance.TicketDAO;

@Service
public class TicketServiceImple implements TicketService {
	private static final Logger logger = LoggerFactory.getLogger(TicketServiceImple.class);
	
	@Autowired
	private TicketDAO ticketDao;
	
	@Override
	public List<TicketVO> readAll() {
		logger.info("readAll() 호출");
		return ticketDao.ticketSelectAll();
	} // end readAll()

	@Override
	public int create(TicketVO vo) {
		logger.info("create() 호출");
		return ticketDao.ticketInsert(vo);
	} // end create()

	@Override
	public List<TicketVO> readByMember(int memberNo) {
		logger.info("readByMember() 호출");
		return ticketDao.ticketSelectByMember(memberNo);
	} // end readByMember()

	@Override
	public TicketVO readDetail(int ticketNo) {
		logger.info("readDetail() 호출");
		return ticketDao.ticketSelectByNo(ticketNo);
	} // end readDetail()

	@Override
	public int delete(int ticketNo) {
		logger.info("delete() 호출");
		return ticketDao.ticketDelete(ticketNo);
	} // end delete()

} // end TicketServiceImple
