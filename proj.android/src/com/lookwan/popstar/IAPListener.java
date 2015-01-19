package com.lookwan.popstar;

import java.util.HashMap;

import mm.purchasesdk.OnPurchaseListener;
import android.content.Context;
import android.widget.Toast;
import mm.purchasesdk.core.utils.LogUtil;

public class IAPListener implements OnPurchaseListener {

	private final String TAG = "IAPListener";
	private Context mContext;
	
	public IAPListener(Context context){
		
		this.mContext = context;
	}

	@Override
	public void onAfterApply() {
	}

	@Override
	public void onAfterDownload() {
		
	}

	@Override
	public void onBeforeApply() {
		
	}

	@Override
	public void onBeforeDownload() {
		
	}

	@Override
	public void onBillingFinish(int arg0, HashMap arg1) {
		
	}

	@Override
	public void onInitFinish(int arg0) {
		LogUtil.e("PopStar","onInitFinish-->"+arg0);

	}

	@Override
	public void onQueryFinish(int arg0, HashMap arg1) {
		
	}

	@Override
	public void onUnsubscribeFinish(int arg0) {
		
	}
	
}
