import java.util.HashMap;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import dao.IBoardDao;

public class Test {
	public static void main(String[] args) {
		ApplicationContext context = 
				new FileSystemXmlApplicationContext("WebContent/WEB-INF/applicationContext.xml");
	
		IBoardDao dao = context.getBean("boardDao",IBoardDao.class);
		
		HashMap<String, Object> test = new HashMap<String, Object>();
		test.put("bkind", 'A');
		System.out.println(dao.getBoardCount(test));
	}
}
