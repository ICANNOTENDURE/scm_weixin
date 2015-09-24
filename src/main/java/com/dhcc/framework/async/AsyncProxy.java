package com.dhcc.framework.async;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Callable;
import java.util.concurrent.CompletionService;
import java.util.concurrent.ExecutorCompletionService;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.annotation.PostConstruct;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

//@Component
public class AsyncProxy {

	private static Log logger = LogFactory.getLog(AsyncProxy.class);
	private static AsyncReceiveMsg successReceMsg = new AsyncReceiveMsg();
	private static BlockingQueue<AsyncMessage> queue = null;
	private static ExecutorService runJobThreadPool = null;
	private static CompletionService<AsyncJobResult> runJobCompletionService = null;


	static {
		int cpuNum = Runtime.getRuntime().availableProcessors();
		queue = new ArrayBlockingQueue<AsyncMessage>(cpuNum * 300);
		successReceMsg.setStatus("success");
		successReceMsg.setMsg("received request ");
		runJobThreadPool = Executors.newFixedThreadPool(cpuNum*50);
		runJobCompletionService = new ExecutorCompletionService<AsyncJobResult>(runJobThreadPool);


	}

	public AsyncProxy(){
		
	}
	
	//@PostConstruct
	private void run(){
		while(true){
			try {
				RunJobExecutor rje = new RunJobExecutor(queue.take());
				runJobCompletionService.submit(rje);
			} catch (InterruptedException e) {
				logger.error(e.getMessage(), e);
			}
		}
	}
	public static AsyncReceiveMsg runAsyncJob(AsyncMessage asyncMessage) {
		try {
			queue.put(asyncMessage);
		} catch (InterruptedException e) {
			logger.error(e.getMessage(), e);
			AsyncReceiveMsg failedReceMsg = new AsyncReceiveMsg();
			failedReceMsg.setMsg(e.getMessage());
			failedReceMsg.setStatus("failed");
			return failedReceMsg;
		}
		return successReceMsg;
	}
	
	class RunJobExecutor implements Callable<AsyncJobResult>{

		AsyncMessage asyncMessage ;
		
		public RunJobExecutor(AsyncMessage asyncMessage){
			this.asyncMessage = asyncMessage;
		}
		
		public AsyncJobResult call() throws Exception {
			
			return null;
		}
		
	}

}
