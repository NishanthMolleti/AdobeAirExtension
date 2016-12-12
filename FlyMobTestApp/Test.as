﻿package
	import flash.text.TextField;
	import FlyMobANE;
	
		public var t_info:TextField;
		
		var flymob:FlyMobANE;
			t_info.text = "";
			Init();
			LoadAd();
			
		function Trace(_msg:String)
		{
			t_info.appendText(_msg + "\n");
		}
				
		public function Init()
		{
			Trace("Init");		
			FlyMobANE.getInstance().interstitialInitialize(605778);
			FlyMobANE.getInstance().addEventListener("interstitialDidLoadAd", interstitialDidLoadAd);
			FlyMobANE.getInstance().addEventListener("interstitialDidFailToLoadAd", interstitialDidFailToLoadAd);
			FlyMobANE.getInstance().addEventListener("interstitialDidShow", interstitialDidShow);
			FlyMobANE.getInstance().addEventListener("interstitialDidClick", interstitialDidClick);
			FlyMobANE.getInstance().addEventListener("interstitialDidClose", interstitialDidClose);
			FlyMobANE.getInstance().addEventListener("interstitialDidExpire", interstitialDidExpire);
		}
		
		public function LoadAd()
		{
			Trace("LoadAd");
			FlyMobANE.getInstance().interstitialLoad();
		}
		
		public function ShowAd()
		{
			Trace("ShowAd");
			FlyMobANE.getInstance().interstitialShow();
		}
		
		function interstitialDidLoadAd (e:Event)
		{
			Trace("interstitialDidLoadAd");
			ShowAd();
		}
		
		function interstitialDidFailToLoadAd (e:Event)
		{
			Trace("interstitialDidFailToLoadAd");
		}
		
		function interstitialDidShow (e:Event)
		{
			Trace("interstitialDidShow");
		}
		
		function interstitialDidClick (e:Event)
		{
			Trace("interstitialDidClick");
		}
		
		
		function interstitialDidClose (e:Event)
		{
			Trace("interstitialDidClose");
		}
		
		function interstitialDidExpire (e:Event)
		{
			Trace("interstitialDidExpire");
		}	
		