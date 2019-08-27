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

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

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
//			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd_HHmmss");
//			String date = fmt.format(new Date());
//			System.out.println(date);
//			FileOutputStream fileOutputStream = new FileOutputStream("C:/Temp/csvTest" + "/" + date +  ".csv", true);
//			OutputStreamWriter OutputStreamWriter = new OutputStreamWriter(fileOutputStream, "MS949");
//			fw = new BufferedWriter(OutputStreamWriter);
//			
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
//			SimpleDateFormat birthfmt = new SimpleDateFormat("yyyy-MM-dd");
//			
//			
//			for(HashMap<String, Object> g : glist) {
//				String birth = birthfmt.format((Date)g.get("MBIRTH"));
//				fw.write(g.get("BNUM") + "," + g.get("MID") + "," + g.get("GAREA") + "," 
//			+ g.get("GTHEMA") + "," + birth + "," + g.get("MGENDER"));
//				fw.newLine();
//			}
//			
//			for(HashMap<String, Object> a : alist) {
//				String birth = birthfmt.format((Date)a.get("MBIRTH"));
//				fw.write(a.get("BNUM") + "," + a.get("MID") + "," + a.get("AAREA") + "," 
//						+ a.get("LIKENAME") + "," + birth + "," + a.get("MGENDER"));
//				fw.newLine();
//			}
			
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
		System.out.println("간다아!");
		test2(glist, alist);
		
	}
	
	
	
	
	
	
	
	public void test2(List<HashMap<String, Object>> glist, List<HashMap<String, Object>> alist) {
		RConnection rconn = null;
		
		try {
			rconn = new RConnection("192.168.10.101", 6311);
			rconn.login("rserve", "rserve");
			
			System.out.println(
					rconn.eval("R.version.string").asString());
			
			rconn
			.eval("source('/home/centos/r_script/rhive.R', encoding='UTF-8')");
			
//			RList list = 
//			rconn.eval("rhive()").asList();
//			int cols = list.size();
//			
//			String s[][] = new String[cols][];
//			
//			for(int i = 0; i < cols; i++) {
//				s[i] = list.at(i).asStrings();
//				for(String m : s[i]) {
//					System.out.println(m);
//				}
//				System.out.println("==================================");
//			}
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		} catch (RserveException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (REXPMismatchException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rconn != null && rconn.isConnected()) {
				System.out.println("커넥션 닫는다.");
				rconn.close();
			}
		}
	}
	
	
	
	
	
	
	
	
}
