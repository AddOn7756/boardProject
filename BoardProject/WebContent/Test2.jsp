<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.board.*, model.users.*, java.util.*"%>
<jsp:useBean id="bDAO" class="model.board.BoardDAO" />
<jsp:useBean id="rDAO" class="model.board.ReplyDAO" />
<jsp:useBean id="rset" class="model.board.ReplySet" />
<jsp:useBean id="rvo" class="model.board.ReplyVO" />
<jsp:useBean id="bvo" class="model.board.BoardVO" />
<jsp:useBean id="uvo" class="model.users.UsersVO" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DAO Test</title>
</head>
<body>
	<!-- ========================================================================= -->
	<%
		ArrayList<ReplySet> rdatas = new ArrayList<ReplySet>();
		BoardSet bdatas = new BoardSet();
		BoardVO bdata = new BoardVO();
		ReplySet rdata = new ReplySet();
		MyReplySet mrs = new MyReplySet();
	%>
	<!-- ========================================================================= -->
	<h2>댓글 출력</h2>
	<%
		//=========================================================================
		// 1 게시판 : N ReplySet(댓글+대댓글)객체 전부 출력
		
		/* uvo.setUserNum(1);	// 유저 pk
		rvo.setbId(1); 		// 게시판 id
		
		// 게시판 id를 가진 어떤 user의 댓글 전체 출력
		// 그냥 전체 출력은 UserNum = 0을 넣으면 됨
		rdatas = rDAO.getDBList(uvo, rvo, 1); // 마지막 숫자 pageNum 값 
		for (ReplySet v : rdatas) {
			System.out.println(v);
			out.println("<br>"+v);
		} */
		
		//=========================================================================
		// ReplySet(댓글+대댓글)객체 하나만 출력할 때
		/* rvo.setrId(1); 		// 댓글 id
		
		rdata = rDAO.getDBData(rvo);
		System.out.println(rdata);
		out.println(rdata); */
	%>
	<hr>
	<!-- ========================================================================= -->
	<h2>게시판 출력</h2>
	<%
		//=========================================================================
		// 게시판 전체 출력
		
		uvo.setUserNum(0); 			// 내가쓴글 전체 출력 할때 userNum 입력
		bvo.setbCtgr("자유게시판");		// 카테고리
		bvo.setbTitle("");			// 검색하고 싶은 제목
		
		bdatas = bDAO.getDBList(uvo, bvo, "조회순", 1); //(3번째 정렬방식, 4번째 pageNum)
		
		for (BoardVO v : bdatas.getBlist()) {
			// System.out.println(v);
			out.println("<hr>");
			out.println(v+"<hr>");
			out.println("<hr>");
		} 
		//=========================================================================
				
		/* uvo.setUserNum(1);	// 내가 쓴 글이면 조회수 증가 안함
		bvo.setbId(1);
		
		
		bdata = bDAO.getDBData(uvo, bvo);
		System.out.println(bdata);
		out.println(bdata); */
		
	%>
	<!-- ========================================================================= -->
	<%
	/* pstmt.setInt(1, vo.getUserNum()); 		// 유저넘버
	pstmt.setString(2, vo.getbCtgr());		// 카테고리
	pstmt.setString(3, vo.getbTitle());		// 타이틀
	pstmt.setString(4, vo.getbContent());	// 내용
	pstmt.setString(5, vo.getbWriter());	// 글쓴이
	pstmt.setString(6, vo.getbLang());		// 프로그래밍 언어 */
	
	/* bvo.setUserNum(1);
	bvo.setbCtgr("자유게시판");
	bvo.setbTitle("게시글 insert 테스트2");
	bvo.setbContent("게시글 insert 테스트2");
	bvo.setbWriter("hong");
	bvo.setbLang("TEST"); */
	
	
	// out.println(bDAO.insert(bvo));
	
	/* pstmt = conn.prepareStatement(sql_INSERT);
	pstmt.setInt(1, vo.getbId());			// 보드 ID
	pstmt.setInt(2, vo.getUserNum());		// 유저넘버
	pstmt.setString(3, vo.getrContent());	// 댓글내용
	pstmt.setString(4, vo.getrWriter());	// 작성자
	pstmt.setInt(5, vo.getParentId());		// 댓글 대댓글 구분 부모 값
	pstmt.executeUpdate(); */
	
	/* rvo.setbId(5);
	rvo.setUserNum(2);
	rvo.setrContent("댓글 insert 테스트2");
	rvo.setrWriter("hong");
	rvo.setParentId(0); 
	
	out.println(rDAO.insert(rvo)); */
	
	// 댓글 삭제
	/* rvo.setrId(6);
	rvo.setbId(2);
	rvo.setParentId(0);
	out.println(rDAO.delete(rvo)); */
	
	// 게시글 삭제
	/* bvo.setbId(25);
	out.println(bDAO.delete(bvo)); */
	
	/* pstmt.setString(1, vo.getbCtgr());
	pstmt.setString(2, vo.getbTitle());
	pstmt.setString(3, vo.getbContent());
	pstmt.setString(4, vo.getbLang());
	pstmt.setInt(5, vo.getbId()); */
	

	/* bvo.setbCtgr("공지사항");
	bvo.setbTitle("게시글 update 테스트1");
	bvo.setbContent("게시글 update 테스트1");
	bvo.setbLang("TEST");
	bvo.setbId(23);
	
	out.println(bDAO.update(bvo)); */
	
	/* pstmt.setString(1, vo.getrContent());
	pstmt.setInt(2, vo.getrId()); */
	
	/* rvo.setrContent("댓글 update 테스트1");
	rvo.setrId(13);
	
	out.println( rDAO.update(rvo)); */
	
	/* uvo.setUserNum(2);
	
	mrs = rDAO.myReply(uvo, 0);
	System.out.println(mrs);
	out.println(mrs);
	 */
	
	%>
	
</body>
</html>