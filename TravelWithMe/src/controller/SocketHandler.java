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

public class SocketHandler extends TextWebSocketHandler implements InitializingBean {
	private final Logger logger = LogManager.getLogger(getClass());
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
	@Autowired
	private IBoardDao testDao; 
	
	Thread thread = null;
	
	
	public SocketHandler (){
		super();
		this.logger.info("create SocketHandler instance!");
		System.out.println("소켓이 생성된거임.");
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session,
			CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		thread.stop();
		sessionSet.remove(session);
		System.out.println("소켓이 제거 된거임.");
		this.logger.info("remove session!");
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session)
			throws Exception {
		super.afterConnectionEstablished(session);
		sessionSet.add(session);
		System.out.println("세션이 더해진거임?");
		this.logger.info("add session!");
		thread = new Thread(){
			@Override
			public void run() {
				while (true){
					try {
						int cnt = testDao.test();
						sendMessage ("데이터 수 :  "+ cnt);
						Thread.sleep(1000);
					} catch (InterruptedException e) {
						e.printStackTrace();
						break;
					}
				}
			}
		};
		thread.start();
	}

	@Override
	public void handleMessage(WebSocketSession session,
			WebSocketMessage<?> message) throws Exception {
		super.handleMessage(session, message);
		this.logger.info("receive message:"+message.toString());
		System.out.println("메시지를 받은거임.");
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
		System.out.println("메소드를 부름.");
		return super.supportsPartialMessages();
	}

	public void sendMessage (String message){
		for (WebSocketSession session: this.sessionSet){
			System.out.println(message);
			if (session.isOpen()){
				try{
					System.out.println("메세지를 페이지로 보내는건가");
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
//		thread = new Thread(){
//			@Override
//			public void run() {
//				while (true){
//					try {
//						int cnt = testDao.getCount();
//						System.out.println("카운트 센다 : " + cnt);
//						sendMessage ("send message index "+ cnt);
//						Thread.sleep(1000);
//					} catch (InterruptedException e) {
//						e.printStackTrace();
//						break;
//					}
//				}
//			}
//		};
//		thread.start();
	}



}