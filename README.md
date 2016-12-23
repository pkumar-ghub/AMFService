# AMFService
amf.js implementation in FlexJS Following are the steps to use this library:

Download & put the AMFService.swc in your project lib folder. Use below code to configure the endpoint & destination:

var amfService:AMFService = new AMFService(); 
amfService.endPoint = "http://localhost:8080/BlazeDS/messagebroker/amf"; 
amfService.addEventListener(ResultEvent.RESULT , onResult); 
amfService.addEventListener(FaultEvent.FAULT , onFault);
amfService.destination = "remoteService"; 
amfService.source = "remoteService"; 
amfService.send("",[parameters]);

private function onResult(evt:ResultEvent):void 
{ 
   trace("Result=" + evt.data); 
}
private function onFault(evt:FaultEvent):void
{ 
   trace("Fault=" + evt.message); 
}

Note- This library currently does not support the direct class mapping.
