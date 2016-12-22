package flexjs.amf.events
{
	import org.apache.flex.events.Event;

	public class FaultEvent extends Event
	{
	    public static const FAULT:String = "fault";	
		public var message:Object;
	
	    public function FaultEvent(type:String, message:Object = null, bubbles:Boolean = false, cancelable:Boolean = true)
	    {
	        super(type, bubbles, cancelable);
			this.message = message;
	    }
	}

}
