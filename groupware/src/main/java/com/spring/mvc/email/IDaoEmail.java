package com.spring.mvc.email;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IDaoEmail {
	
	//받은메일 누르면 로그인 아이디=mail_rcvmember에 맞춰 데이터 List로 가져오기
	public List<DtoEmail> listRcvMail(String key,@Param("pagenum") int pagenum,@Param("contentnum") int contentnum);
	
	//휴지통 누르면 로그인 아이디=mail_rcvmember and rcv=0 ,=member_id and send=0
	public List<DtoEmail> listTrashMail(String key,@Param("pagenum") int pagenum,@Param("contentnum") int contentnum);
	
	//저장메일 누르면 로그인 아이디=mail_rcvmember and rcv=2 ,=member_id and send=2
	public List<DtoEmail> listSaveMail(String key,@Param("pagenum") int pagenum,@Param("contentnum") int contentnum);
		
	//보낸메일 누르면 로그인 아이디=member_id에 맞춰 데이터 List로가져오기
	public List<DtoEmail> listSendMail(String key,@Param("pagenum") int pagenum, @Param("contentnum")int contentnum);
	
	//메일쓰기 번호(id=후에자동입력),보낸사람,받을사람,보낸시간,제목,내용
	public void insertMail(String mail_title,String mail_content,String member_id,String mail_rcvmember);
	
	//메일삭제 번호 입력시 메일삭제
	public void deleteMail(String key);
	
	//메일제목 클릭시 메일읽기
	public DtoEmail listMail(String key);
	
	//받은메일 삭제시 휴지통으로 보내기
	public void moveTrashRcv(String key);
	
	//보낸메일 삭제시 휴지통으로 보내기
	public void moveTrashSend(String key);
	
	//보낸메일 복원시 보낸메일함으로 보내기
	public void moveSendMail(String key);
	
	//받은메일 복원시 받은메일함으로 보내기
	public void moveRcvMail(String key);
	
	//받은메일 저장시 저장메일함으로 보내기
	public void moveSaveRcv(String key);
	
	//보낸메일 저장시 저장메일함으로 보내기
	public void moveSaveSend(String key);
	
	//총 받은메일 개수 구하기
	public int rcvcount(String key);
	
	//총 보낸메일 개수 구하기
	public int sendcount(String key);
	
	//총 휴지통 메일 개수 구하기
	public int trashcount(String key);
	
	//총 저장메일 개수 구하기
	public int savecount(String key);
	
	//받은메일 읽을 때 받은시간 입력하기
	public void rcvtime(String key);
	
	//날짜 시간나오기 테스트
	public String testdate(String key);
	
	//휴지통 받은메일 삭제시 rcv -1
	public void makeMinusRcv(String key);
	
	//휴지통 보낸메일 삭제시 send -1
	public void makeMinusSend(String key);
	
	//홈페이지 메인에 최신메일 5개 띄우기
	public List<DtoEmail> listRecentMail(String key);
	
	//메일쓰기 시 member테이블에 등록되어있는 id값 콤보박스보내기
	public List<MemberDTO> mailWriteMember();
	
	//수신자 있는지 비교하기
	public int receivercnt(String key);
	
}
