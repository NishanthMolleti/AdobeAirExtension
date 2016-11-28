package
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.external.ExtensionContext;
	import flash.system.Capabilities;
	
	
	public class FlyMobANE extends EventDispatcher
	{
		private static var _context:ExtensionContext;
		private static const EXTENSION_ID:String = "flymob.com";    
		private static var isIOS:Boolean = (Capabilities.manufacturer.indexOf("iOS") != -1);
		private static var isAndroid:Boolean = (Capabilities.manufacturer.indexOf("Android") != -1);
		
		public function FlyMobANE(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		private static function isSupported():Boolean
		{
			if ( isIOS || isAndroid )
			{
				createExtensionContext();
				
				return true;
			}
			return false;
		}
		
		private static function createExtensionContext():void
		{
			if ( _context == null )
			{
				_context = ExtensionContext.createExtensionContext(EXTENSION_ID, null);
			}
		}
		
		// Interstitial
		
		public static function interstitialInitialize(value:int):void
		{        
			if ( isSupported() )
			{
				_context.call("interstitialInitialize", value);
			}
		}
		
		public static function interstitialLoad():void
		{        
			if ( isSupported() )
			{
				_context.call("interstitialLoad");
			}
		}
		
		public static function interstitialShow():void
		{        
			if ( isSupported() )
			{
				_context.call("interstitialShow");
			}
		}
		
		public static function interstitialIsReady():Boolean
		{        
			if ( isSupported() )
			{
				return _context.call("interstitialIsReady") as Boolean;
			}
			return false;
		}
		
		// Rewarded video
		
		public static function rewardedVideoInitialize(value:int):void
		{        
			if ( isSupported() )
			{
				_context.call("rewardedVideoInitialize", value);
			}
		}
		
		public static function rewardedVideoLoad():void
		{        
			if ( isSupported() )
			{
				_context.call("rewardedVideoLoad");
			}
		}
		
		public static function rewardedVideoShow():void
		{        
			if ( isSupported() )
			{
				_context.call("rewardedVideoShow");
			}
		}
		
		public static function rewardedVideoIsReady():Boolean
		{        
			if ( isSupported() )
			{
				return _context.call("rewardedVideoIsReady") as Boolean;
			}
			return false;
		}
		
		// Configuration
		
		public static function setDebugMode(value:Boolean):void
		{        
			if ( isSupported() )
			{
				_context.call("setDebugMode", value);
			}
		}
		
		public static function isDebugMode():Boolean
		{        
			if ( isSupported() )
			{
				return _context.call("isDebugMode") as Boolean;
			}
			return false;
		}
		
		public static function setCoppa(value:Boolean):void
		{        
			if ( isSupported() )
			{
				_context.call("setCoppa", value);
			}
		}
		
		public static function isCoppa():Boolean
		{        
			if ( isSupported() )
			{
				return _context.call("isCoppa") as Boolean;
			}
			return false;
		}
		
		public static function setDnt(value:Boolean):void
		{        
			if ( isSupported() )
			{
				_context.call("setDnt", value);
			}
		}
		
		public static function isDnt():Boolean
		{        
			if ( isSupported() )
			{
				return _context.call("isDnt") as Boolean;
			}
			return false;
		}
		
		public static function setTesting(value:Boolean):void
		{        
			if ( isSupported() )
			{
				_context.call("setTesting", value);
			}
		}
		
		public static function isTesting():Boolean
		{        
			if ( isSupported() )
			{
				return _context.call("isTesting") as Boolean;
			}
			return false;
		}
	}
}