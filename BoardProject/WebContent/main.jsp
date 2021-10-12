<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

img{

 width :50px;
 height :50px;
}
</style>
</head>
<body>
	<div>
 <button onClick="location.href='imgform.do'">이미지 업로드</button>
		<table>

			<c:forEach items="${datas}" var="vo">				
				<tr>
					<td>유저번호:</td>
					<td><p>${vo.userNum}</p></td>
				</tr>
				<tr>
					<td>이미지 :</td>
					<td><img src="images/${vo.iconId}"></td>
				</tr>
				<tr>
					<td><button onClick="location.href='imgDelete.do?filename=${vo.iconId}&userNum=${vo.userNum}'">이미지 삭제</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>