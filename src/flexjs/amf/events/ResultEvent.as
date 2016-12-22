package flexjs.amf.events
{
	import org.apache.flex.events.Event;
	
	public class ResultEvent extends Event
	{
		public static const RESULT:String = "result";
		public var data:Object;
		public function ResultEvent(type:String, resultData:Object=null, bubbles:Boolean = false, cancelable:Boolean = true)
		{
			super(type, bubbles, cancelable);
			this.data = resultData;
		}
	}
}

