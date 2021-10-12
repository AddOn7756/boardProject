<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action = "imgUpload.do" method="post" name="form1" enctype="multipart/form-data">	
		<!-- <input type="hidden" name="usernum" value="1"> -->
		<table>
			<tr>
				<td>유저번호 :</td>
				<td><input type="text" name="usernum" /></td>
			</tr>
			<tr>
				<td>사진 :</td>
				<td><input type="file" value="파일 선택" name="filename" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="업로드"/></td>
			</tr>
		</table>
	</form>
</body>
</html>