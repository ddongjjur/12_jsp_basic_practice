<%@page import="_06_file_prac.FileDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="_06_file_prac.FileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileEx02_list_prac</title>
</head>
<body>

	<h3>파일 리스트!!</h3>
	
	<table border="1">
		<tr>
			<th>작성자!!</th>
			<th>제목!!</th>
			<th>파일명!!</th>
			<th>크기!!</th>
			<th>첨부파일!!</th>
			<th>날짜!!</th>
		</tr>
		
		<%
			
			ArrayList<FileDTO> fileList = FileDAO.getInstance().getFileList();
		
			for (FileDTO fileDTO : fileList) {
				
		%>
				<tr>
					<td><%=fileDTO.getUserName() %></td>
					<td><%=fileDTO.getTitle() %></td>
					<td><%=fileDTO.getOriginalFileName() %></td>
					<td><%=fileDTO.getLength() %></td>
					<td><a href="fileEx02_download_prac.jsp?fileName<%=fileDTO.getFilesystemName() %>">다운로드!!</a></td>
					<td><%=fileDTO.getFileUploadDate() %></td>
				</tr>
		<%
				
			}
		
		%>
		
		<tr>
			<td colspan="6">업로드 화면으로 돌아가기!!</td>
		</tr>
	</table>

</body>
</html>