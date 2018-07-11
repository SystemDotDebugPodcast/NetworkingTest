global class NetworkingTestRemote {
    
    @RemoteAction
    global static Map<String, Object> performRemoteCallToAPI() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://www.postpwnd.com/testAPI.php');
        req.setMethod('GET');
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        Map<String, Object> body = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
        
        return body;
    }
    
}
