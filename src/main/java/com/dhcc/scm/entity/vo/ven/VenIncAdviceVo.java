/**
 * 
 */
package com.dhcc.scm.entity.vo.ven;

import java.sql.Timestamp;



public class VenIncAdviceVo {
	
	private Long askid;
	
	private String ask;
	
	private String askname;
	
	private Timestamp askdate;
	
	private String replay;
	
	private String replayname;
	
	private Timestamp replaydate;

	public String getAsk() {
		return ask;
	}

	public void setAsk(String ask) {
		this.ask = ask;
	}

	public String getAskname() {
		return askname;
	}

	public void setAskname(String askname) {
		this.askname = askname;
	}

	public Timestamp getAskdate() {
		return askdate;
	}

	public void setAskdate(Timestamp askdate) {
		this.askdate = askdate;
	}

	public String getReplay() {
		return replay;
	}

	public void setReplay(String replay) {
		this.replay = replay;
	}

	public String getReplayname() {
		return replayname;
	}

	public void setReplayname(String replayname) {
		this.replayname = replayname;
	}

	public Timestamp getReplaydate() {
		return replaydate;
	}

	public void setReplaydate(Timestamp replaydate) {
		this.replaydate = replaydate;
	}

	public Long getAskid() {
		return askid;
	}

	public void setAskid(Long askid) {
		this.askid = askid;
	}
	
	
}
