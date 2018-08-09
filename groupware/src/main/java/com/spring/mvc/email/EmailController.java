package com.spring.mvc.email;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EmailController {
	@Autowired
	private SqlSession sqlSession;
	private HttpSession session;
	//index.jsp?center=email/
	
	//메일메인
		@RequestMapping("/mailMain")
		public String mailMain() {
			
		 return "index.jsp?center=email/mailMain";
		}
		
	//메일 홈화면
		@RequestMapping("/homeMail")
		public String homeMail() {
		
			return "email/mailMain.jsp?right=homeMail";
		}
		
	//받은 메일함을 연다
		@RequestMapping(value="/rcvMail", method=RequestMethod.GET)
		public String rcvMail(HttpServletRequest request,Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			session = request.getSession();
			String member_id = (String) session.getAttribute("member_id");
			
			PageMakerEmail pagemaker = new PageMakerEmail();
			String pagenum = request.getParameter("pagenum");
			String contentnum = request.getParameter("contentnum");
					
			int cpagenum = Integer.parseInt(pagenum);
			int ccontentnum = Integer.parseInt(contentnum);		
			
			session.setAttribute("pagenum", pagenum);

			int rcvcount = dao.rcvcount(member_id);
			pagemaker.setTotalcount(rcvcount);
			pagemaker.setPagenum(cpagenum-1);
			pagemaker.setContentnum(ccontentnum);
					
			pagemaker.setCurrentblock(cpagenum);
			pagemaker.setLastblock(pagemaker.getTotalcount());
			
			pagemaker.prevnext(cpagenum);
			pagemaker.setStartPage(pagemaker.getCurrentblock());
			pagemaker.setEndPage(pagemaker.getLastblock(), pagemaker.getCurrentblock());
			int totalcount = dao.rcvcount(member_id);
			int lastpage = pagemaker.calcpage(totalcount, ccontentnum);
			
			List<DtoEmail> dto = dao.listRcvMail(member_id,pagemaker.getPagenum()*15+1,cpagenum*ccontentnum);
			if(dto.isEmpty()) {
				return "index.jsp?center=email/mailMain.jsp?right=rcvMail";
			}
			
			if(cpagenum==lastpage) {
				for(int j=0;j<cpagenum-lastpage+1;j++) {
					Timestamp rcvdate = dto.get(j).getMail_rcvdate();
					if(rcvdate==null) {
						dto.get(j).setRead("안읽음");
					}else {
						dto.get(j).setRead("읽음");
					}
				}
			}else {
			for(int j=0;j<ccontentnum;j++) {
				Timestamp rcvdate = dto.get(j).getMail_rcvdate();
				if(rcvdate==null) {
					dto.get(j).setRead("안읽음");
				}else {
					dto.get(j).setRead("읽음");
				}
			}
		}
			model.addAttribute("listRcvMail",dto);
			model.addAttribute("page",pagemaker);
			
			return "index.jsp?center=email/mailMain.jsp?right=rcvMail";
		}
		
		//보낸메일함을 연다
		@RequestMapping("/sendMail")
		public String sendMail(HttpServletRequest request,Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			session = request.getSession();
			String member_id = (String) session.getAttribute("member_id");
			
			PageMakerEmail pagemaker = new PageMakerEmail();
			String pagenum = request.getParameter("pagenum");
			String contentnum = request.getParameter("contentnum");
//						
			int cpagenum = Integer.parseInt(pagenum);
			int ccontentnum = Integer.parseInt(contentnum);		

			int sendcount = dao.sendcount(member_id);
			pagemaker.setTotalcount(sendcount);
			pagemaker.setPagenum(cpagenum-1);
			pagemaker.setContentnum(ccontentnum);
			
	
			
			pagemaker.setCurrentblock(cpagenum);
			pagemaker.setLastblock(pagemaker.getTotalcount());
			
			pagemaker.prevnext(cpagenum);
			pagemaker.setStartPage(pagemaker.getCurrentblock());
			pagemaker.setEndPage(pagemaker.getLastblock(), pagemaker.getCurrentblock());
			int totalcount = dao.sendcount(member_id);
			int lastpage = pagemaker.calcpage(totalcount, ccontentnum);
			
			List<DtoEmail> dto = dao.listSendMail(member_id,pagemaker.getPagenum()*15+1,cpagenum*ccontentnum);
			if(dto.isEmpty()) {
				return "index.jsp?center=email/mailMain.jsp?right=sendMail";
			}
			
			if(cpagenum==lastpage) {
				for(int j=0;j<cpagenum-lastpage+1;j++) {
					Timestamp rcvdate = dto.get(j).getMail_rcvdate();
					if(rcvdate==null) {
						dto.get(j).setRead("안읽음");
					}else {
						dto.get(j).setRead("읽음");
					}
				}
			}else {
			for(int j=0;j<ccontentnum;j++) {
				Timestamp rcvdate = dto.get(j).getMail_rcvdate();
				if(rcvdate==null) {
					dto.get(j).setRead("안읽음");
				}else {
					dto.get(j).setRead("읽음");
				}
			}
		}
			
			model.addAttribute("listSendMail",dto);
			model.addAttribute("page",pagemaker);
			
			
			return "index.jsp?center=email/mailMain.jsp?right=sendMail";
		}
		//휴지통을 연다
		@RequestMapping("/trashMail")
		public String trashMail(HttpServletRequest request,Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			session = request.getSession();
			String member_id = (String) session.getAttribute("member_id");
			
			PageMakerEmail pagemaker = new PageMakerEmail();
			String pagenum = request.getParameter("pagenum");
			String contentnum = request.getParameter("contentnum");
//					
			int cpagenum = Integer.parseInt(pagenum);
			int ccontentnum = Integer.parseInt(contentnum);		

			int sendcount = dao.trashcount(member_id );
			pagemaker.setTotalcount(sendcount);
			pagemaker.setPagenum(cpagenum-1);
			pagemaker.setContentnum(ccontentnum);

			pagemaker.setCurrentblock(cpagenum);
			pagemaker.setLastblock(pagemaker.getTotalcount());
			
			pagemaker.prevnext(cpagenum);
			pagemaker.setStartPage(pagemaker.getCurrentblock());
			pagemaker.setEndPage(pagemaker.getLastblock(), pagemaker.getCurrentblock());
			int totalcount = dao.trashcount(member_id);
			int lastpage = pagemaker.calcpage(totalcount, ccontentnum);
			
			List<DtoEmail> dto = dao.listTrashMail(member_id,pagemaker.getPagenum()*15+1,cpagenum*ccontentnum);
			if(dto.isEmpty()) {
				return "index.jsp?center=email/mailMain.jsp?right=trashMail";
			}

			if(cpagenum==lastpage) {
				for(int j=0;j<cpagenum-lastpage+1;j++) {
					Timestamp rcvdate = dto.get(j).getMail_rcvdate();
					if(rcvdate==null) {
						dto.get(j).setRead("안읽음");
					}else {
						dto.get(j).setRead("읽음");
					}
				}
			}else {
			for(int j=0;j<ccontentnum;j++) {
				Timestamp rcvdate = dto.get(j).getMail_rcvdate();
				if(rcvdate==null) {
					dto.get(j).setRead("안읽음");
				}else {
					dto.get(j).setRead("읽음");
				}
			}
		}
			
			model.addAttribute("listTrashMail",dto);
			model.addAttribute("page",pagemaker);
			
			return "index.jsp?center=email/mailMain.jsp?right=trashMail";
		}
		
		//저장메일함을 연다
		@RequestMapping("/saveMail")
		public String saveMail(HttpServletRequest request,Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			session = request.getSession();
			String member_id = (String) session.getAttribute("member_id");
			
			PageMakerEmail pagemaker = new PageMakerEmail();
			String pagenum = request.getParameter("pagenum");
			String contentnum = request.getParameter("contentnum");
//					
			int cpagenum = Integer.parseInt(pagenum);
			int ccontentnum = Integer.parseInt(contentnum);		

			int sendcount = dao.savecount(member_id);
			pagemaker.setTotalcount(sendcount);
			pagemaker.setPagenum(cpagenum-1);
			pagemaker.setContentnum(ccontentnum);

			pagemaker.setCurrentblock(cpagenum);
			pagemaker.setLastblock(pagemaker.getTotalcount());
			
			pagemaker.prevnext(cpagenum);
			pagemaker.setStartPage(pagemaker.getCurrentblock());
			pagemaker.setEndPage(pagemaker.getLastblock(), pagemaker.getCurrentblock());
			int totalcount = dao.savecount(member_id);
			int lastpage = pagemaker.calcpage(totalcount, ccontentnum);
			
			List<DtoEmail> dto = dao.listSaveMail(member_id,pagemaker.getPagenum()*15+1,cpagenum*ccontentnum);
			if(dto.isEmpty()) {
				return "index.jsp?center=email/mailMain.jsp?right=saveMail";
			}
			
			if(cpagenum==lastpage) {
				for(int j=0;j<cpagenum-lastpage+1;j++) {
					Timestamp rcvdate = dto.get(j).getMail_rcvdate();
					if(rcvdate==null) {
						dto.get(j).setRead("안읽음");
					}else {
						dto.get(j).setRead("읽음");
					}
				}
			}else {
			for(int j=0;j<ccontentnum;j++) {
				Timestamp rcvdate = dto.get(j).getMail_rcvdate();
				if(rcvdate==null) {
					dto.get(j).setRead("안읽음");
				}else {
					dto.get(j).setRead("읽음");
				}
			}
		}
			
			model.addAttribute("listSaveMail",dto);
			model.addAttribute("page",pagemaker);
						
			return "index.jsp?center=email/mailMain.jsp?right=saveMail";
		}
		//받은메일 읽기
		@RequestMapping("/readMailRcv")
		public String readMailRcv(HttpServletRequest request, Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			
			String mail_num = request.getParameter("mail_num");
			
			dao.rcvtime(mail_num);
			DtoEmail dto = dao.listMail(mail_num);
			model.addAttribute("listMail",dto);
			
			return "index.jsp?center=email/mailMain.jsp?right=readMailRcv";
		}
		//보낸메일 읽기
		@RequestMapping("/readMailSend")
		public String readMailSend(HttpServletRequest request, Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			
			String mail_num = request.getParameter("mail_num");
			
			DtoEmail dto = dao.listMail(mail_num);
			model.addAttribute("listMail",dto);
			
			return "index.jsp?center=email/mailMain.jsp?right=readMailSend";
		}
		//휴지통메일읽기
		@RequestMapping("/readMailTrash")
		public String readMailTrash(HttpServletRequest request, Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			
			String mail_num = request.getParameter("mail_num");
			
			DtoEmail dto = dao.listMail(mail_num);
			model.addAttribute("listMail",dto);
			
			return "index.jsp?center=email/mailMain.jsp?right=readMailTrash";
		}
		//저장메일읽기
		@RequestMapping("/readMailSave")
		public String readMailSave(HttpServletRequest request, Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			
			String mail_num = request.getParameter("mail_num");
			
			DtoEmail dto = dao.listMail(mail_num);
			model.addAttribute("listMail",dto);
			
			return "index.jsp?center=email/mailMain.jsp?right=readMailSave";
		}
		//메일쓰기
		@RequestMapping("/writeMail")
		public String writeMail(HttpServletRequest request, Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			
			List<MemberDTO> dto = dao.mailWriteMember();
	
			
			String member_id = request.getParameter("member_id");
			model.addAttribute("member_id",member_id);
			model.addAttribute("writemember", dto);
			return "index.jsp?center=email/mailMain.jsp?right=writeMail";
		}
		
		//메일쓰기 - Click id
		@RequestMapping("/writeMailClick")
		public String writeMailClick(HttpServletRequest request, Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			session = request.getSession();
			String member_id = (String) session.getAttribute("member_id");
			List<MemberDTO> dto = dao.mailWriteMember();
			
			String mail_rcvmember = request.getParameter("mail_rcvmember");
			model.addAttribute("mail_rcvmember",mail_rcvmember);
			model.addAttribute("member_id",member_id);
			model.addAttribute("writemember", dto);
			return "index.jsp?center=email/mailMain.jsp?right=writeMailClick";
		}
		//메일 보내고 확인창
		@RequestMapping("/confirmMail")
		public String confirmMail(HttpServletRequest request, Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			
			String reciever = request.getParameter("reciever");
			String[] rcvsp = reciever.split(",");
		
			ArrayList<String> error_rcv = new ArrayList<String>();
			String sender = request.getParameter("sender");
			String title = request.getParameter("title");
			
			if(title==null||title=="") {
				title = "<제목없음>";
			}
			String content = request.getParameter("content");
			if(content==null||content=="") {
				content = "<내용없음>";
			}
			for(int i=0;i<rcvsp.length;i++) {
				int cnt = dao.receivercnt(rcvsp[i]);
				if(cnt==1) {
					dao.insertMail(title, content, sender, rcvsp[i]);	
				}
				if(cnt!=1) {
					error_rcv.add(rcvsp[i]);
				}
			}
			model.addAttribute("error_rcv", error_rcv);
			return "index.jsp?center=email/mailMain.jsp?right=confirmMail";
		}
		//받은메일 !함!에서 휴지통으로//체크박스
		@RequestMapping("/moveTrashRcvMole")
		public String moveTrashRcvMole(HttpServletRequest request, Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			session = request.getSession();
			
			String pagenum = (String)session.getAttribute("pagenum");
			int pagenums = Integer.parseInt(pagenum);
			
			String list = request.getParameter("check");
			int cnt = Integer.parseInt(request.getParameter("cnt"));
			
			String[] parsing = new String[cnt];
			for(int i=0;i<cnt;i++) {
				parsing = list.split(",");
			}
			for(int i=0;i<parsing.length;i++) {
				dao.moveTrashRcv(parsing[i]);
			}
			return "redirect:rcvMail?pagenum="+pagenums+"&contentnum=15";
		}
		//받은메일 !함!에서 읽기처리하기
		@RequestMapping("/moveReadRcvMole")
		public String moveReadRcvMole(HttpServletRequest request, Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			session = request.getSession();
			
			String pagenum = (String)session.getAttribute("pagenum");
			int pagenums = Integer.parseInt(pagenum);
			
			String list = request.getParameter("check");
			int cnt = Integer.parseInt(request.getParameter("cnt"));
			
			String[] parsing = new String[cnt];
			for(int i=0;i<cnt;i++) {
				parsing = list.split(",");
			}
			for(int i=0;i<parsing.length;i++) {
				dao.rcvtime(parsing[i]);
			}
			return "redirect:rcvMail?pagenum="+pagenums+"&contentnum=15";
		}
		//받은메일 !함!에서 저장메일로
		@RequestMapping("/moveSaveRcvMole")
		public String moveSaveRcvMole(HttpServletRequest request, Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			session = request.getSession();
			
			String pagenum = (String)session.getAttribute("pagenum");
			int pagenums = Integer.parseInt(pagenum);
			
			String list = request.getParameter("check");
			int cnt = Integer.parseInt(request.getParameter("cnt"));
			
			String[] parsing = new String[cnt];
			for(int i=0;i<cnt;i++) {
				parsing = list.split(",");
			}
			for(int i=0;i<parsing.length;i++) {
				dao.moveSaveRcv(parsing[i]);
			}
			return "redirect:rcvMail?pagenum="+pagenums+"&contentnum=15";
		}
		//보낸메일 !함!에서 휴지통으로
		@RequestMapping("/moveTrashSendMole")
		public String moveTrashSendMole(HttpServletRequest request, Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			session = request.getSession();
			
			String pagenum = (String)session.getAttribute("pagenum");
			int pagenums = Integer.parseInt(pagenum);
			
			String list = request.getParameter("check");
			int cnt = Integer.parseInt(request.getParameter("cnt"));
			
			String[] parsing = new String[cnt];
			for(int i=0;i<cnt;i++) {
				parsing = list.split(",");
			}
			for(int i=0;i<parsing.length;i++) {
				dao.moveTrashSend(parsing[i]);
			}
			return "redirect:sendMail?pagenum="+pagenums+"&contentnum=15";
		}	
		//보낸메일 !함!에서 저장메일로
		@RequestMapping("/moveSaveSendMole")
		public String moveSaveSendMole(HttpServletRequest request, Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			session = request.getSession();
			
			String pagenum = (String)session.getAttribute("pagenum");
			int pagenums = Integer.parseInt(pagenum);
			
			String list = request.getParameter("check");
			int cnt = Integer.parseInt(request.getParameter("cnt"));
			
			String[] parsing = new String[cnt];
			for(int i=0;i<cnt;i++) {
				parsing = list.split(",");
			}
			for(int i=0;i<parsing.length;i++) {
				dao.moveSaveSend(parsing[i]);
			}
			return "redirect:sendMail?pagenum="+pagenums+"&contentnum=15";
		}
		
		
		//받은메일에서 휴지통으로
		@RequestMapping("/moveTrashRcv")
		public String moveTrashRcv(HttpServletRequest request, Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			session = request.getSession();

			String pagenum = (String)session.getAttribute("pagenum");
			int pagenums = Integer.parseInt(pagenum);
			
			String mail_num = request.getParameter("mail_num");
			dao.moveTrashRcv(mail_num);
					
			return "redirect:rcvMail?pagenum="+pagenums+"&contentnum=15";
		}
		
		//받은메일에서 저장함으로
		@RequestMapping("/moveSaveRcv")
		public String moveSaveRcv(HttpServletRequest request, Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			session = request.getSession();

			String pagenum = (String)session.getAttribute("pagenum");
			int pagenums = Integer.parseInt(pagenum);
			
			String mail_num = request.getParameter("mail_num");
			dao.moveSaveRcv(mail_num);
		
			return "redirect:rcvMail?pagenum="+pagenums+"&contentnum=15";
		}
		
		//보낸메일에서 휴지통으로
		@RequestMapping("/moveTrashSend")
		public String moveTrashSend(HttpServletRequest request, Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			session = request.getSession();

			String pagenum = (String)session.getAttribute("pagenum");
			int pagenums = Integer.parseInt(pagenum);
			
			String mail_num = request.getParameter("mail_num");
			dao.moveTrashSend(mail_num);
		
			return "redirect:sendMail?pagenum="+pagenums+"&contentnum=15";
		}
		
		//보낸메일에서 저장함으로
		@RequestMapping("/moveSaveSend")
		public String moveSaveSend(HttpServletRequest request, Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			session = request.getSession();

			String pagenum = (String)session.getAttribute("pagenum");
			int pagenums = Integer.parseInt(pagenum);
			
			String mail_num = request.getParameter("mail_num");
			dao.moveSaveSend(mail_num);
			
			return "redirect:sendMail?pagenum="+pagenums+"&contentnum=15";
		}
		//저장메일 !함! 에서 단체복원
		@RequestMapping("/recoverMailSaveMole")
		public String recoverMailSaveMole(HttpServletRequest request, Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			session = request.getSession();
			
			String login_id = (String) session.getAttribute("member_id");
			
			String pagenum = (String)session.getAttribute("pagenum");
			int pagenums = Integer.parseInt(pagenum);
			
			String list = request.getParameter("check");
			int cnt = Integer.parseInt(request.getParameter("cnt"));
			
			String[] parsing = new String[cnt];
			for(int i=0;i<cnt;i++) {
				parsing = list.split(",");
			}
			for(int i=0;i<parsing.length;i++) {
				DtoEmail dto = dao.listMail(parsing[i]);
				String mail_num2 = dto.getMail_num()+"";
				String member_id2 = dto.getMember_id();
				String mail_rcvmember2 = dto.getMail_rcvmember();
				
				if(login_id.equals(member_id2)) {
					dao.moveSendMail(mail_num2);
				}
				if(login_id.equals(mail_rcvmember2)) {
					dao.moveRcvMail(mail_num2);
				}
			}
			return "redirect:saveMail?pagenum="+pagenums+"&contentnum=15";
		}
		//휴지!통!에서 단체복원
		@RequestMapping("/recoverMailTrashMole")
		public String recoverMailTrashMole(HttpServletRequest request, Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			session = request.getSession();
			
			session = request.getSession();
			String login_id = (String) session.getAttribute("member_id");
			
			String pagenum = (String)session.getAttribute("pagenum");
			int pagenums = Integer.parseInt(pagenum);
			
			String list = request.getParameter("check");
			int cnt = Integer.parseInt(request.getParameter("cnt"));
			
			String[] parsing = new String[cnt];
			for(int i=0;i<cnt;i++) {
				parsing = list.split(",");
			}
			for(int i=0;i<parsing.length;i++) {
				DtoEmail dto = dao.listMail(parsing[i]);
				String mail_num2 = dto.getMail_num()+"";
				String member_id2 = dto.getMember_id();
				String mail_rcvmember2 = dto.getMail_rcvmember();
				
				if(login_id.equals(member_id2)) {
					dao.moveSendMail(mail_num2);
				}
				if(login_id.equals(mail_rcvmember2)) {
					dao.moveRcvMail(mail_num2);
				}
			}
			return "redirect:trashMail?pagenum="+pagenums+"&contentnum=15";
		}
		
		
		//메일 복원하기  저장메일>받은메일함 or 보낸메일함
		@RequestMapping("/recoverMailSave")
		public String recoverMailSave(HttpServletRequest request, Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			session = request.getSession();
			String pagenum = (String)session.getAttribute("pagenum");
			int pagenums = Integer.parseInt(pagenum);
			String login_id = (String) session.getAttribute("member_id");
			
			String mail_num = request.getParameter("mail_num");
			String member_id = request.getParameter("member_id");
			String mail_rcvmember = request.getParameter("mail_rcvmember");		
			
			if(login_id.equals(member_id)) 
				dao.moveSendMail(mail_num);
			if(login_id.equals(mail_rcvmember))
				dao.moveRcvMail(mail_num);
			
			return "redirect:saveMail?pagenum="+pagenums+"&contentnum=15";
		}
		//메일 복원하기 휴지통>받은메일함 or 보낸메일함
		@RequestMapping("/recoverMailTrash")
		public String recoverMailTrash(HttpServletRequest request, Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			session = request.getSession();
			String pagenum = (String)session.getAttribute("pagenum");
			int pagenums = Integer.parseInt(pagenum);
			String login_id = (String) session.getAttribute("member_id");
			
			String mail_num = request.getParameter("mail_num");
			String member_id = request.getParameter("member_id");
			String mail_rcvmember = request.getParameter("mail_rcvmember");		
			
			if(login_id.equals(member_id)) 
				dao.moveSendMail(mail_num);
			if(login_id.equals(mail_rcvmember))
				dao.moveRcvMail(mail_num);
			
			return "redirect:trashMail?pagenum="+pagenums+"&contentnum=15";
		}
		
		
		//저장메일에서 휴지통으로
		@RequestMapping("/moveTrashSave")
		public String moveTrashSave(HttpServletRequest request, Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			session = request.getSession();
			String pagenum = (String)session.getAttribute("pagenum");
			int pagenums = Integer.parseInt(pagenum);
			String login_id = (String) session.getAttribute("member_id");
			
			String mail_num = request.getParameter("mail_num");
			String member_id = request.getParameter("member_id");
			String mail_rcvmember = request.getParameter("mail_rcvmember");
			
			if(login_id.equals(member_id)) {
				dao.moveTrashSend(mail_num);
			}
			if(login_id.equals(mail_rcvmember)) {
				dao.moveTrashRcv(mail_num);
			}
			
			return "redirect:saveMail?pagenum="+pagenums+"&contentnum=15";
		}
		//저장메일 !함!에서 휴지통으로
		@RequestMapping("/moveTrashSaveMole")
		public String moveTrashSaveMole(HttpServletRequest request, Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			session = request.getSession();
			String login_id = (String) session.getAttribute("member_id");
			
			String pagenum = (String)session.getAttribute("pagenum");
			int pagenums = Integer.parseInt(pagenum);
			
			String list = request.getParameter("check");
			int cnt = Integer.parseInt(request.getParameter("cnt"));
			
			String[] parsing = new String[cnt];
			for(int i=0;i<cnt;i++) {
				parsing = list.split(",");
			}
			for(int i=0;i<parsing.length;i++) {
				DtoEmail dto = dao.listMail(parsing[i]);
				String mail_num2 = dto.getMail_num()+"";
				String member_id2 = dto.getMember_id();
				String mail_rcvmember2 = dto.getMail_rcvmember();
				
				if(login_id.equals(member_id2)) {
					dao.moveTrashSend(mail_num2);
				}
				if(login_id.equals(mail_rcvmember2)) {
					dao.moveTrashRcv(mail_num2);
				}
			}
			return "redirect:saveMail?pagenum="+pagenums+"&contentnum=15";
		}
		
		//휴지통에서 삭제시
		@RequestMapping("/delete")
		public String delete(HttpServletRequest request, Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			session = request.getSession();
			String login_id = (String) session.getAttribute("member_id");
			String pagenum = (String)session.getAttribute("pagenum");
			int pagenums = Integer.parseInt(pagenum);
			
			String mail_num = request.getParameter("mail_num");
			String member_id = request.getParameter("member_id");
			String mail_rcvmember = request.getParameter("mail_rcvmember");
			
			if(login_id.equals(member_id)) 
				dao.makeMinusSend(mail_num);
			if(login_id.equals(mail_rcvmember)) 
				dao.makeMinusRcv(mail_num);
			
			DtoEmail dto = dao.listMail(mail_num);
	
			
			if(dto.getRcv()==-1&&dto.getSend()==-1) {
				dao.deleteMail(mail_num);
			}
			return "redirect:trashMail?pagenum="+pagenums+"&contentnum=15";
		}
		
		//휴지통!함!에서 단체삭제처리
		@RequestMapping("/deleteMole")
		public String deleteMole(HttpServletRequest request, Model model) {
			IDaoEmail dao = sqlSession.getMapper(IDaoEmail.class);
			session = request.getSession();
			String login_id = (String) session.getAttribute("member_id");
			
			String pagenum = (String)session.getAttribute("pagenum");
			int pagenums = Integer.parseInt(pagenum);
			
			String list = request.getParameter("check");
			int cnt = Integer.parseInt(request.getParameter("cnt"));
			
			String[] parsing = new String[cnt];
			for(int i=0;i<cnt;i++) {
				parsing = list.split(",");
			}
			for(int i=0;i<parsing.length;i++) {
				DtoEmail dto = dao.listMail(parsing[i]);
				String mail_num2 = dto.getMail_num()+"";
				String member_id2 = dto.getMember_id();
				String mail_rcvmember2 = dto.getMail_rcvmember();
				
				if(login_id.equals(member_id2)) {
					dao.makeMinusSend(mail_num2);
				}
				if(login_id.equals(mail_rcvmember2)) {
					dao.makeMinusRcv(mail_num2);
				}
				dto = dao.listMail(parsing[i]);
				if(dto.getRcv()==-1&&dto.getSend()==-1) {
					dao.deleteMail(mail_num2);
				}
			}
			return "redirect:trashMail?pagenum="+pagenums+"&contentnum=15";
		}

}
