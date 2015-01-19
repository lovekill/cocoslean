package com.lookwan.popstar;

import android.content.Context;
import android.os.Handler;
import android.os.Message;

public class IAPHandler extends Handler{

	public static final int INIT_FINISH = 10000;
	public static final int BILL_FINISH = 10001;
	public static final int QUERY_FINISH = 10002;
	public static final int UNSUB_FINISH = 10003;
	
	private Context mContext;
	
	public IAPHandler(Context context){
		this.mContext = context;
	}
	
	@Override
	public void handleMessage(Message msg){
		super.handleMessage(msg);
		int what  = msg.what;
		
	}
	
}
