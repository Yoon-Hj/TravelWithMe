package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import service.AdminService;
import service.BoardService;
import service.MemberService;

@Controller
public class AdminController {
	@Autowired
	private MemberService a_msvc;
	@Autowired
	private BoardService a_bsvc;
	@Autowired
	private AdminService a_asvc;
	
}
