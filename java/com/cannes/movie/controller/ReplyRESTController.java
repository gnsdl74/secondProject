package com.cannes.movie.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cannes.movie.domain.ReplyVO;
import com.cannes.movie.pageutil.PageCriteria;
import com.cannes.movie.pageutil.PageMaker;
import com.cannes.movie.service.ReplyService;

@RestController
@RequestMapping(value="/reply")
public class ReplyRESTController {
	private static final Logger logger = LoggerFactory.getLogger(ReplyRESTController.class);
	
	@Autowired
	private ReplyService replyService;	
	
	@GetMapping(value = "/all/{movieNo}/{page}")
	public ResponseEntity<List<ReplyVO>> replyList(
			@PathVariable("movieNo") Integer movieNo, @PathVariable("page") Integer page){
		logger.info("replyList( 호출");
		
		// 댓글 목록 가져오기
		PageCriteria pageCriteria = new PageCriteria();
		pageCriteria.setMovieNo(movieNo);
		 if (page != null) {
			 pageCriteria.setPage(page);
		 }
		
		List<ReplyVO> list  = replyService.readPage(pageCriteria);	
		int totalNum = replyService.getTotalNumByMovieNo(movieNo);
		ReplyVO vo = list.get(0);
		vo.setPageMaker(new PageMaker());
		PageMaker maker = vo.getPageMaker();
		maker.setCriteria(pageCriteria);
		maker.setTotalCount(totalNum);
		maker.setPageData();
		
		return new ResponseEntity<List<ReplyVO>>(list, HttpStatus.OK);
	} // end ReponseEntity()
	 
	
} // end ReplyController
