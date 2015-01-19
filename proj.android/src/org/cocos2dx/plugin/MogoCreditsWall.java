package org.cocos2dx.plugin;

import java.util.HashMap;
import java.util.Hashtable;

import android.content.res.Resources;
import mm.purchasesdk.OnPurchaseListener;
import mm.purchasesdk.core.PurchaseCode;
import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import android.widget.Toast;

import com.lookwan.popstar.IAPHelper;
import com.lookwan.popstar.PopStar;

public class MogoCreditsWall implements InterfaceCreditsWall {

	private static Activity mContext = null;
	private static MogoCreditsWall mAdapter = null;
	SharedPreferences mSharedPreferences;
	SharedPreferences.Editor mEditor;
	public static final String FISRT = "first_point" ;
	Resources res ;
	public MogoCreditsWall(Context context) {
		mContext = (Activity) context;
		res = context.getResources() ;
		mAdapter = this;
		mSharedPreferences = mContext.getSharedPreferences("cach_data",
				Activity.MODE_PRIVATE);
		mEditor = mSharedPreferences.edit();
	}

	private void setFirstPoint(){
		mEditor.putBoolean(FISRT, false);
		mEditor.commit() ;
	}
	
	private boolean getFirstPoint() {
		return mSharedPreferences.getBoolean(FISRT, true) ;
	}
	@Override
	public void configDeveloperInfo(Hashtable<String, String> cpInfo) {

	}

	@Override
	public void showOffer() {
	}

	public void addCreditsWall(int num) {
		try {

		} catch (Exception e) {

		}
	}

	public void removeCreditsWall(int num) {

	}

	public void showCreditsWallShop(final int points) {
		Log.i("showCreditswallShop","start pay") ;
		PluginWrapper.runOnMainThread(new Runnable() {
			public void run() {

				IAPHelper iapHelper = new IAPHelper(mContext);
				if(points==5&&!getFirstPoint()){
					Toast.makeText(mContext, "此商品仅能购买一次，请购买其他商品！", Toast.LENGTH_SHORT)
					.show();
					return ;
				}
				
				final int payGoldNumber = iapHelper.getPayGoldNumber(points);

				if (PopStar.purchase != null) {

					try {

						Log.i("TAGS", "runOnMainThread");

						PopStar.purchase.order(mContext,
								iapHelper.getPayCode(points),
								iapHelper.getRePay(points),
								new OnPurchaseListener() {

									@Override
									public void onUnsubscribeFinish(int arg0) {

									}

									@Override
									public void onQueryFinish(int arg0,
											HashMap arg1) {

									}

									@Override
									public void onInitFinish(int arg0) {

									}

									@Override
									public void onBillingFinish(int code,
											HashMap arg1) {

										Log.i("TAGS", "runOnMainThread : "
												+ code);

										if (code == PurchaseCode.ORDER_OK
												|| (code == PurchaseCode.AUTH_OK)
												|| (code == PurchaseCode.WEAK_ORDER_OK)) {
											updateOffer(payGoldNumber);
											String result = String
													.format(mContext
															.getResources()
															.getString(res.getIdentifier("pay_success_title","string",mContext.getPackageName())
																	),
															payGoldNumber);
											Toast.makeText(mContext, result, Toast.LENGTH_SHORT)
													.show();
											if(points==5){
												setFirstPoint() ;
											}
										}
									}

									@Override
									public void onBeforeDownload() {

									}

									@Override
									public void onBeforeApply() {

									}

									@Override
									public void onAfterDownload() {

									}

									@Override
									public void onAfterApply() {

									}
								});

					} catch (Exception ex) {

					}

				}

				// updateOffer(payGoldNumber);
				//
				// String result =
				// String.format(mContext.getResources().getString(R.string.pay_success_title),payGoldNumber);
				//
				// Toast.makeText(mContext, result, 1).show();

			}
		});
	}

	public void showAdviceDialog() {

		PluginWrapper.runOnMainThread(new Runnable() {

			public void run() {
				// AppConnect.getInstance(mContext).showFeedback();
			}

		});

	}

	public void updateOffer(long arg0) {
		CreditsWallWrapper.onCreditsWallResult(this, (int) arg0,
				String.valueOf(arg0));
	}

	public static void updateOfferValue(long arg0) {
		if (mAdapter != null) {
			mAdapter.updateOffer(arg0);
		}
	}
}
