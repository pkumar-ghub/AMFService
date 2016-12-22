package flexjs.amf
{
	import flexjs.amf.events.FaultEvent;
	import flexjs.amf.events.ResultEvent;
	
	import org.apache.flex.events.EventDispatcher;

	[Event(name="result", type="flexjs.amf.events")]
	[Event(name="fault", type="flexjs.amf.events")]
	public class AMFService extends EventDispatcher
	{
		private var _endPoint:String;
		private var _destination:String;
		private var _source:String;
		
		/** 
		 * 
		 * <inject_html>
		 * <script src="https://rawgit.com/emilkm/amfjs/master/amf.js"></script>
		 * </inject_html>
		 */ 
		public function AMFService(){}
		
		public function set endPoint(value:String):void
		{
			_endPoint = value;	
		}
		
		public function get endPoint():String
		{
			return _endPoint;	
		}
		
		public function set destination(value:String):void
		{
			_destination = value;	
		}
		
		public function get destination():String
		{
			return _destination;	
		}
		
		public function set source(value:String):void
		{
			_source = value;	
		}
		
		public function get source():String
		{
			return _source;	
		}
		
		
		public function send(operation:String , params:Array):void
		{
			COMPILE::JS
			{
					//var amfClient:Object = new ((window as Object).amf).Client("patientService", "http://localhost:8080/BlazeDS/messagebroker/amf");
					//var amfReq:Object = amfClient.invoke("patientService", "getPatientNames", []);
					//amfReq.then(resultHandler , faultHandler);
				
				var amfClient:Object = new ((window as Object).amf).Client(_destination, _endPoint);
				var amfReq:Object = amfClient.invoke(_source, operation, params);
				amfReq.then(resultHandler , faultHandler);
			}
		}
		
		private function resultHandler(param:Object):void
		{
			dispatchEvent(new ResultEvent(ResultEvent.RESULT,param));
		}
		
		private function faultHandler(param:Object):void
		{
			dispatchEvent(new FaultEvent(FaultEvent.FAULT,param));
			
		}
	}
}