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
	
	
	
	
	
	
	
	
	
	
	
	
}
