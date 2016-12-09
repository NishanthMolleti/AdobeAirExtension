package
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	//import flash.events.IEventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	import flash.system.Capabilities;
	
	
	public final class FlyMobANE extends EventDispatcher
	{
		private static var _instance:FlyMobANE;
		
		private static var _context:ExtensionContext;
		private static const EXTENSION_ID:String = "flymob.com";    
		private static var isIOS:Boolean = (Capabilities.manufacturer.indexOf("iOS") != -1);
		private static var isAndroid:Boolean = (Capabilities.manufacturer.indexOf("Android") != -1);
		
		public static function getInstance():FlyMobANE
		{	
			if(!_instance)
			{
				new FlyMobANE();
			} 
			return _instance;
		}
		
		public function FlyMobANE()
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
				
				_context.addEventListener(StatusEvent.STATUS, onNativeCallback);
			}
		}
		
		private function onNativeCallback(event:StatusEvent):void
		{
			switch (event.code)
			{
				// Interstitial
				case ("interstitialDidLoadAd"):
				{
					dispatchEvent(new Event("interstitialDidLoadAd"));
				}
					break;
				case ("interstitialDidFailToLoadAd"):
				{
					dispatchEvent(new Event("interstitialDidFailToLoadAd"));
				}
					break;
				case ("interstitialDidShow"):
				{
					dispatchEvent(new Event("interstitialDidShow"));
				}
					break;
				case ("interstitialDidClick"):
				{
					dispatchEvent(new Event("interstitialDidClick"));
				}
					break;
				case ("interstitialDidClose"):
				{
					dispatchEvent(new Event("interstitialDidClose"));
				}
					break;
				case ("interstitialDidExpire"):
				{
					dispatchEvent(new Event("interstitialDidExpire"));
				}
					break;
				// Rewarded
				case ("rewardedVideoDidLoadAd"):
				{
					dispatchEvent(new Event("rewardedVideoDidLoadAd"));
				}
					break;
				case ("rewardedVideoDidFailToLoadAd"):
				{
					dispatchEvent(new Event("rewardedVideoDidFailToLoadAd"));
				}
					break;
				case ("rewardedVideoDidShow"):
				{
					dispatchEvent(new Event("rewardedVideoDidShow"));
				}
					break;
				case ("rewardedVideoDidComplete"):
				{
					dispatchEvent(new Event("rewardedVideoDidComplete"));
				}
					break;
				case ("rewardedVideoDidStart"):
				{
					dispatchEvent(new Event("rewardedVideoDidStart"));
				}
					break;
				case ("rewardedVideoDidClose"):
				{
					dispatchEvent(new Event("rewardedVideoDidClose"));
				}
					break;
				case ("rewardedVideoDidExpire"):
				{
					dispatchEvent(new Event("rewardedVideoDidExpire"));
				}
					break;
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