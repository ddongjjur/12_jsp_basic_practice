<%@page import="_06_file_prac.FileDAO"%>
<%@page import="_06_file_prac.FileDTO"%>
<%@page import="java.util.ArrayList"%>
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
			
			String location = "C:\\Users\\동주\\git\\12_jsp_basic_practice\\12_jsp_basic_practice\\WebContent\\file_rapo_prac";
			
			MultipartRequest multi = new MultipartRequest (
					
					request,
					location,
					1024 * 1024 * 30,
					"utf-8",
					new DefaultFileRenamePolicy()
					
					);
			String userName = multi.getParameter("userName");
			String title = multi.getParameter("title");
			
			Enumeration files = multi.getFileNames();
			
			ArrayList<FileDTO> fileList = new ArrayList<FileDTO>();
			
			while (files.hasMoreElements()) {
				
				String element = (String)files.nextElement();
				
				if (multi.getOriginalFileName(element) != null) {
					
					FileDTO fileDTO = new FileDTO();
					
					fileDTO.setUserName(userName);
					fileDTO.setTitle(title);
					fileDTO.setOriginalFileName(multi.getOriginalFileName(element));
					fileDTO.setFilesystemName(multi.getFilesystemName(element));
					fileDTO.setContentType(multi.getContentType(element));
					fileDTO.setLength(multi.getFile(element).length());
					
					fileList.add(fileDTO);
					
				}
				
			}
			
			FileDAO.getInstance().insertFiles(fileList);
			
	%>
			
			<script type="text/javascript">
				alert("파일이 업로드 되었습니다.");
				location.href = "fileEx02_form_prac.jsp";
			</script>
		
	<%
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>

</body>
</html>