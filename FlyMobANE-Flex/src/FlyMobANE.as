package
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	import flash.system.Capabilities;
	
	
	public class FlyMobANE extends EventDispatcher
	{
		private static var _instance:FlyMobANE;
		
		private static var _context:ExtensionContext;
		private static const EXTENSION_ID:String = "flymob.com";    
		private static var isIOS:Boolean = (Capabilities.manufacturer.indexOf("iOS") != -1);
		private static var isAndroid:Boolean = (Capabilities.manufacturer.indexOf("Android") != -1);
		
		public static function getInstance():FlyMobANE{
			if(!_instance)
			{
				new FlyMobANE();
			} 
			return _instance;
		}
		
		public function FlyMobANE(target:IEventDispatcher=null)
		{
			if(_instance)
			{
				throw new Error("Singleton... use getInstance()");
			} 
			_instance = this;
		}
		
		private function isSupported():Boolean
		{
			if ( isIOS || isAndroid )
			{
				createExtensionContext();
				
				return true;
			}
			return false;
		}
		
		private function createExtensionContext():void
		{
			if ( _context == null )
			{
				_context = ExtensionContext.createExtensionContext(EXTENSION_ID, null);
				
				_context.addEventListener(StatusEvent.STATUS, interstitialDidLoadAd);
				_context.addEventListener(StatusEvent.STATUS, interstitialDidFailToLoadAd);
				_context.addEventListener(StatusEvent.STATUS, interstitialDidShow);
				_context.addEventListener(StatusEvent.STATUS, interstitialDidClick);
				_context.addEventListener(StatusEvent.STATUS, interstitialDidClose);
				_context.addEventListener(StatusEvent.STATUS, interstitialDidExpire);
				
				_context.addEventListener(StatusEvent.STATUS, rewardedVideoDidLoadAd);
				_context.addEventListener(StatusEvent.STATUS, rewardedVideoDidFailToLoadAd);
				_context.addEventListener(StatusEvent.STATUS, rewardedVideoDidShow);
				_context.addEventListener(StatusEvent.STATUS, rewardedVideoDidComplete);
				_context.addEventListener(StatusEvent.STATUS, rewardedVideoDidStart);
				_context.addEventListener(StatusEvent.STATUS, rewardedVideoDidClose);
				_context.addEventListener(StatusEvent.STATUS, rewardedVideoDidExpire);
			}
		}
		
		// Interstitial
		
		public function interstitialInitialize(value:int):void
		{        
			if ( isSupported() )
			{
				_context.call("interstitialInitialize", value);
			}
		}
		
		public function interstitialLoad():void
		{        
			if ( isSupported() )
			{
				_context.call("interstitialLoad");
			}
		}
		
		public function interstitialShow():void
		{        
			if ( isSupported() )
			{
				_context.call("interstitialShow");
			}
		}
		
		public function interstitialIsReady():Boolean
		{        
			if ( isSupported() )
			{
				return _context.call("interstitialIsReady") as Boolean;
			}
			return false;
		}
		
		// Events
		
		private function interstitialDidLoadAd(event:StatusEvent):void
		{
			dispatchEvent(new Event("interstitialDidLoadAd"));
		}
		
		private function interstitialDidFailToLoadAd(event:StatusEvent):void
		{
			dispatchEvent(new Event("interstitialDidFailToLoadAd"));
		}
		
		private function interstitialDidShow(event:StatusEvent):void
		{
			dispatchEvent(new Event("interstitialDidShow"));
		}
		
		private function interstitialDidClick(event:StatusEvent):void
		{
			dispatchEvent(new Event("interstitialDidClick"));
		}
		
		private function interstitialDidClose(event:StatusEvent):void
		{
			dispatchEvent(new Event("interstitialDidClose"));
		}
		
		private function interstitialDidExpire(event:StatusEvent):void
		{
			dispatchEvent(new Event("interstitialDidExpire"));
		}
		
		// Rewarded video
		
		public function rewardedVideoInitialize(value:int):void
		{        
			if ( isSupported() )
			{
				_context.call("rewardedVideoInitialize", value);
			}
		}
		
		public function rewardedVideoLoad():void
		{        
			if ( isSupported() )
			{
				_context.call("rewardedVideoLoad");
			}
		}
		
		public function rewardedVideoShow():void
		{        
			if ( isSupported() )
			{
				_context.call("rewardedVideoShow");
			}
		}
		
		public function rewardedVideoIsReady():Boolean
		{        
			if ( isSupported() )
			{
				return _context.call("rewardedVideoIsReady") as Boolean;
			}
			return false;
		}
		
		// Events
		
		private function rewardedVideoDidLoadAd(event:StatusEvent):void
		{
			dispatchEvent(new Event("rewardedVideoDidLoadAd"));
		}
		
		private function rewardedVideoDidFailToLoadAd(event:StatusEvent):void
		{
			dispatchEvent(new Event("rewardedVideoDidFailToLoadAd"));
		}
		
		private function rewardedVideoDidShow(event:StatusEvent):void
		{
			dispatchEvent(new Event("rewardedVideoDidShow"));
		}
		
		private function rewardedVideoDidComplete(event:StatusEvent):void
		{
			dispatchEvent(new Event("rewardedVideoDidComplete"));
		}
		
		private function rewardedVideoDidStart(event:StatusEvent):void
		{
			dispatchEvent(new Event("rewardedVideoDidStart"));
		}
		
		private function rewardedVideoDidClose(event:StatusEvent):void
		{
			dispatchEvent(new Event("rewardedVideoDidClose"));
		}
		
		private function rewardedVideoDidExpire(event:StatusEvent):void
		{
			dispatchEvent(new Event("rewardedVideoDidExpire"));
		}
		
		// Configuration
		
		public function setDebugMode(value:Boolean):void
		{        
			if ( isSupported() )
			{
				_context.call("setDebugMode", value);
			}
		}
		
		public function isDebugMode():Boolean
		{        
			if ( isSupported() )
			{
				return _context.call("isDebugMode") as Boolean;
			}
			return false;
		}
		
		public function setCoppa(value:Boolean):void
		{        
			if ( isSupported() )
			{
				_context.call("setCoppa", value);
			}
		}
		
		public function isCoppa():Boolean
		{        
			if ( isSupported() )
			{
				return _context.call("isCoppa") as Boolean;
			}
			return false;
		}
		
		public function setDnt(value:Boolean):void
		{        
			if ( isSupported() )
			{
				_context.call("setDnt", value);
			}
		}
		
		public function isDnt():Boolean
		{        
			if ( isSupported() )
			{
				return _context.call("isDnt") as Boolean;
			}
			return false;
		}
		
		public function setTesting(value:Boolean):void
		{        
			if ( isSupported() )
			{
				_context.call("setTesting", value);
			}
		}
		
		public function isTesting():Boolean
		{        
			if ( isSupported() )
			{
				return _context.call("isTesting") as Boolean;
			}
			return false;
		}
	}
}