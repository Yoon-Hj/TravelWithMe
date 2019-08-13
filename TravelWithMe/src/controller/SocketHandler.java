package controller;

import java.util.HashSet;
import java.util.Set;


import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import dao.IBoardDao;
import dao.IMemberDao;

public class SocketHandler extends TextWebSocketHandler implements InitializingBean {
	private final Logger logger = LogManager.getLogger(getClass());
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();

	@Autowired
	private IMemberDao web_dao;
	
	
	public SocketHandler (){
		super();
		this.logger.info("create SocketHandler instance!");
//		System.out.println("소켓이 생성된거임.");
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session,
			CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		
		sessionSet.remove(session);
		session.close();
		
//		System.out.println("소켓이 제거 된거임.");
		this.logger.info("remove session!");
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session)
			throws Exception {
		super.afterConnectionEstablished(session);
//		System.out.println("세션이 더해진거임?");
		this.logger.info("add session!");
		
		sessionSet.add(session);
		
	}

	@Override
	public void handleMessage(WebSocketSession session,
			WebSocketMessage<?> message) throws Exception {
		super.handleMessage(session, message);
		this.logger.info("receive message:"+message.toString());
		
		new Thread(new SessionThread(session, (String)message.getPayload())).start();
//		System.out.println("메시지를 받은거임.");
	}
	@Override
	public void handleTransportError(WebSocketSession session,
			Throwable exception) throws Exception {
		this.logger.error("web socket error!", exception);
		System.out.println("에러가 발생한거임");
	}

	@Override
	public boolean supportsPartialMessages() {
		this.logger.info("call method!");
//		System.out.println("메소드를 부름.");
		return super.supportsPartialMessages();
	}

	public void sendMessage (String message){
		for (WebSocketSession session: sessionSet){
//			System.out.println(message);
			if (session.isOpen()){
				try{
//					System.out.println("메세지를 페이지로 보내는건가");
					session.sendMessage(new TextMessage(message));
				}catch (Exception ignored){
					this.logger.error("fail to send message!", ignored);
				}
			}
		}
	}


	@Override
	public void afterPropertiesSet() throws Exception {
		System.out.println("뭔가 되긴 하냐");
	}
	
	
	
	class SessionThread implements Runnable{
		WebSocketSession s;
		String mid;
		
		public SessionThread(WebSocketSession s, String mid) {
			this.s = s;
			this.mid = mid;
		}

		@Override
		public void run() {
			// TODO Auto-generated method stub
			int i = 0;
			while (true){
				try {
					int cnt = web_dao.getMyNoticeCount(mid);
					sendMessage (i++ + "알림  "+ cnt);
					Thread.sleep(2000);
				} catch (InterruptedException e) {
					e.printStackTrace();
					break;
				}
				if(!s.isOpen()) break;
			}
		}
		
	}


}