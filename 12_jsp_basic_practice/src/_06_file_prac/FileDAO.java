package _06_file_prac;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

public class FileDAO {

	private FileDAO() {}
	private static FileDAO instance = new FileDAO();
	public static FileDAO getInstance() {
		return instance;
	}
	
	private Connection conn 		= null;   			
    private PreparedStatement pstmt = null;
    private ResultSet rs 			= null;  			
	
    public void getConnection() {
    	
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/file_ex?serverTimezone=UTC&useSSL=false","root","1234");
		} catch (Exception e) {			
			e.printStackTrace();
		}	
	    
	}	
	
    
    public void getClose() {
		if (rs != null)    {try {rs.close();}    catch (SQLException e) {}}
		if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
		if (conn != null)  {try {conn.close();}  catch (SQLException e) {}}
	}
    
    public void insertFiles(ArrayList<FileDTO> fileList) {
		
    	try {

    		getConnection();
    		
    		for (FileDTO fileDTO : fileList) {
    			
    			pstmt = conn.prepareStatement("INSERT INTO FILE VALUES(?, ?, ?, ?, ?, ?, NOW())");
    			pstmt.setString(1, fileDTO.getUserName());
    			pstmt.setString(2, fileDTO.getTitle());
    			pstmt.setString(3, fileDTO.getOriginalFileName());
    			pstmt.setString(4, fileDTO.getFilesystemName());
    			pstmt.setString(5, fileDTO.getContentType());
    			pstmt.setLong(6, fileDTO.getLength());
    			
    			pstmt.executeUpdate();
				
			}
    		
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	
	}
    
    public ArrayList<FileDTO> getFileList() {
		
    	ArrayList<FileDTO> fileList = new ArrayList<FileDTO>();
    	
    	try {
			
    		getConnection();
    		
    		pstmt = conn.prepareStatement("SELECT * FROM FILE");
    		rs = pstmt.executeQuery();
    		
    		while (rs.next()) {
				
    			FileDTO fileDTO = new FileDTO();
    			
    			fileDTO.setUserName(rs.getString("USER_NAME"));
    			fileDTO.setTitle(rs.getString("TITLE"));
    			fileDTO.setOriginalFileName(rs.getString("ORIGINAL_FILE_NAME"));
    			fileDTO.setFilesystemName(rs.getString("FILESYSTEM_NAME"));
    			fileDTO.setContentType(rs.getString("CONTENT_TYPE"));
    			fileDTO.setLength(rs.getLong("LENGTH"));
    			fileDTO.setFileUploadDate(rs.getDate("FILE_UPLOAD_DATE"));
    			
    			fileList.add(fileDTO);
    			
			}
    		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
    	
    	return fileList;
    	
	}
    
}