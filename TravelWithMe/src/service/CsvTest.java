package service;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import model.AccomBoard;
import model.GuideBoard;

public class CsvTest {
	public void test(List<HashMap<String, Object>> glist, List<HashMap<String, Object>> alist) {
		for(HashMap<String, Object> q : glist)
			System.out.println(q);
		System.out.println("===============================================");
		for(HashMap<String, Object> q : alist)
			System.out.println(q);
		System.out.println(glist.size());
		System.out.println(alist.size());
		
		
		int cnt = 0;
		BufferedWriter fw = null;
		try {
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HHmmss");
			String date = fmt.format(new Date());
			System.out.println(date);
			FileOutputStream fileOutputStream = new FileOutputStream("C:/Temp/csvTest" + "/" + date +  ".csv", true);
			OutputStreamWriter OutputStreamWriter = new OutputStreamWriter(fileOutputStream, "MS949");
			fw = new BufferedWriter(OutputStreamWriter);
			
//			for(GuideBoard gb : g) {
//				fw.write(gb.getBnum() + "," + gb.getGarea() + "," + gb.getGthema());
//				fw.newLine();
//				cnt ++;
//			}
//			
//			for(AccomBoard gb : a) {
//				fw.write(gb.getBnum() + "," + gb.getAarea() + "," + gb.getAcourse());
//				fw.newLine();
//				cnt ++;
//			}
			SimpleDateFormat birthfmt = new SimpleDateFormat("yyyy-MM-dd");
			
			
			for(HashMap<String, Object> g : glist) {
				String birth = birthfmt.format((Date)g.get("MBIRTH"));
				fw.write(g.get("BNUM") + "," + g.get("MID") + "," + g.get("GAREA") + "," 
			+ g.get("GTHEMA") + "," + birth + "," + g.get("MGENDER"));
				fw.newLine();
			}
			
			for(HashMap<String, Object> a : alist) {
				String birth = birthfmt.format((Date)a.get("MBIRTH"));
				fw.write(a.get("BNUM") + "," + a.get("MID") + "," + a.get("AAREA") + "," 
						+ a.get("LIKENAME") + "," + birth + "," + a.get("MGENDER"));
				fw.newLine();
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
				try {
					if(fw != null)
						fw.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		
		
	}
	
	
//	public int download() {
//		FTPClient client = null;
//		  BufferedOutputStream bos = null;
//		  File fPath  = null;
//		  File fDir = null;
//		  File f   = null;
//		   
//		  String url  = PropertiesHandler.getValue("FTP_URL"); //서버 ip
//		  String id  = PropertiesHandler.getValue("FTP_ID"); // ftp 접속 id
//		  String pwd  = PropertiesHandler.getValue("FTP_PWD"); // ftp 접속 비밀번호
//		  String port = PropertiesHandler.getValue("FTP_PORT"); //ftp 포트
//		  String downloadPath = request.getSession().getServletContext().getRealPath("/") + PropertiesHandler.getValue("FTP_PATH"); //다운로드 경로
//		   
//		  int result = -1;
//		   
//		  try{
//		   // download 경로에 해당하는 디렉토리 생성 
//		   downloadPath = downloadPath + filePath; 
//		   fPath     = new File(downloadPath);
//		   fDir   = fPath;
//		   fDir.mkdirs();
//		    
//		   f = new File(downloadPath, fileName);
//		    
//		   client = new FTPClient();
//		   client.setControlEncoding("UTF-8");
//		   client.connect(url, Integer.parseInt(port));
//		    
//		   int resultCode = client.getReplyCode();
//		   if (FTPReply.isPositiveCompletion(resultCode) == false){
//		    client.disconnect();
//		    throw new CommonException("FTP 서버에 연결할 수 없습니다.");
//		   }
//		   else
//		   {
//		    client.setSoTimeout(5000);
//		    boolean isLogin = client.login(id, pwd);
//		     
//		    if (isLogin == false){
//		     throw new CommonException("FTP 서버에 로그인 할 수 없습니다.");
//		    }
//		     
//		    client.setFileType(FTP.BINARY_FILE_TYPE);
//		    client.changeWorkingDirectory(filePath);
//		     
//		    bos = new BufferedOutputStream(new FileOutputStream(f));
//		    boolean isSuccess = client.retrieveFile(fileName, bos);
//		     
//		    if (isSuccess){
//		     result = 1; // 성공    
//		    }
//		    else{
//		     throw new CommonException("파일 다운로드를 할 수 없습니다.");
//		    }   
//		     
//		    client.logout();   
//		   } // if ~ else
//		  }
//		  catch (Exception e){
//		   throw new CommonException("FTP Exception : " + e);
//		  }
//		  finally{ 
//		   if (bos != null) try {bos.close();} catch (Exception e) {}    
//		   if (client != null && client.isConnected()) try {client.disconnect();} catch (Exception e) {}
//		    
//		   return result;
//
//
//	}
	
	
	
	
	
	
	
	
	
}
