package com.lookwan.popstar;

import android.content.Context;

public class IAPHelper {

	private String mPayCode[] = { "30000839203706", "30000839203705",
			"30000839203704", "30000839203703", "30000839203702",
			"30000839203701" };
	
	private String mPayName[] = { "250金币", "100金币", "50金币", "20金币", "10金币",
			"1金币" };

	private float mPayMuch[] = { 25f, 10f, 5f, 2f, 1f, 0.1f };
	
	private int mPayGoldNumber[] = {250,100,50,20,10,1};
	
	private int canRepay[] = {1,1,1,1,1,1};
	public IAPHelper(Context context){
		int coderId = context.getResources().getIdentifier("paycode","array",context.getPackageName()) ;
		mPayCode=context.getResources().getStringArray(coderId) ;
	}
	public String getPayCode(int num){
		
		if(mPayCode.length > num && num >=0){
			
			return mPayCode[num];
		}
		
		return null;
	}
	
	public String getPayName(int num){
		
		if(mPayName.length > num && num >=0){
			
			return mPayName[num];
		}
		
		return null;
	}
	
	public float getPayMuch(int num){
		
		if(mPayMuch.length > num && num >=0){
			
			return mPayMuch[num];
		}
		
		return 0f;
	}
	
	public int getPayGoldNumber(int num){
		
		if(mPayGoldNumber.length>num && num >=0){
			
			return mPayGoldNumber[num];
		}
		
		return 0;
	}
	
	public int getRePay(int num){
		
		if(canRepay.length > num && num >= 0){
			
			return canRepay[num];
		}
		
		return 8;
		
	}
	
}
