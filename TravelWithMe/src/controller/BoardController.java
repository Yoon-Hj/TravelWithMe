package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import service.AdminService;
import service.BoardService;
import service.MemberService;

@Controller
public class BoardController {
	@Autowired
	private MemberService b_msvc;
	@Autowired
	private BoardService b_bsvc;
	@Autowired
	private AdminService b_asvc;
}
