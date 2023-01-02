<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload_prac</title>
</head>
<body>

	<%
		try {
			
			String location = "C:\\Users\\15_web_Ydj\\eclipse-workspace\\12_jsp_basic_practice\\WebContent\\file_repo_prac";
			
			MultipartRequest multi = new MultipartRequest (
					
					request,
					location,
					1024 * 1024 * 30,
					"utf-8",
					new DefaultFileRenamePolicy()
					
					);
			String writer = multi.getParameter("writer");
			String title = multi.getParameter("title");
			
			// 여기부터 @@@@@@
			
			Enumeration files = multi.getFileNames();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>

</body>
</html>