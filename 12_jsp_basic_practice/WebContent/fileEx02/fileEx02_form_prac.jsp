<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form_prac</title>
</head>
<body>

	<form action="fileEx02_upload.jsp" method="post" enctype="multipart/form-data">
		<fieldset>
			<legend>파일 업로드!!!</legend>
			<p>작성자: <input type="text" name="writer"></p>
			<p>제목: <input type="text" name="title"></p>
			<p>파일명1: <input type="file" name="uploadFile1"></p>
			<p>파일명2: <input type="file" name="uploadFile2"></p>
			<p>파일명3: <input type="file" name="uploadFile3"></p>
			<p><input type="submit" value="파일 올리기">
			<p><input type="button" value="파일 리스트"></p>
		</fieldset>
	</form>

</body>
</html>