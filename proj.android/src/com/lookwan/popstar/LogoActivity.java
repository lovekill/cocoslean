package com.lookwan.popstar;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;

public class LogoActivity extends Activity {

	Handler handler = new Handler();
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(getResources().getIdentifier("logo_layout","layout",getPackageName()));
		
		handler.postDelayed(new Runnable() {
			
			@Override
			public void run() {

				Intent intent = new Intent(LogoActivity.this,PopStar.class);
				startActivity(intent);
				finish();
				//overridePendingTransition(R.anim.fade_in, R.anim.fade_out);
			}
		}, 1000);
		
	}
	
}
