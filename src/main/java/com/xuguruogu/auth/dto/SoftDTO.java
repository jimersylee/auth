package com.xuguruogu.auth.dto;

import java.io.Serializable;

public class SoftDTO implements Serializable {

	/**  */
	private static final long serialVersionUID = -5058138313226583283L;

	/** 软件编号 */
	private long softcode;

	/** 软件校验码 */
	private String softkey;

	/** 软件名称 */
	private String softname;

	/** 锁定标记 */
	private boolean lock;

	/** 校验在线最长间隔时间 */
	private long intervaltime;

	/** 公匙 */
	private String clientpublickey;

	/** 私匙 */
	private String serverprivatekey;

	public long getSoftcode() {
		return softcode;
	}

	public void setSoftcode(long softcode) {
		this.softcode = softcode;
	}

	public String getSoftkey() {
		return softkey;
	}

	public void setSoftkey(String softkey) {
		this.softkey = softkey;
	}

	public String getSoftname() {
		return softname;
	}

	public void setSoftname(String softname) {
		this.softname = softname;
	}

	public boolean isLock() {
		return lock;
	}

	public void setLock(boolean lock) {
		this.lock = lock;
	}

	public long getIntervaltime() {
		return intervaltime;
	}

	public void setIntervaltime(long intervaltime) {
		this.intervaltime = intervaltime;
	}

	public String getClientpublickey() {
		return clientpublickey;
	}

	public void setClientpublickey(String clientpublickey) {
		this.clientpublickey = clientpublickey;
	}

	public String getServerprivatekey() {
		return serverprivatekey;
	}

	public void setServerprivatekey(String serverprivatekey) {
		this.serverprivatekey = serverprivatekey;
	}

}