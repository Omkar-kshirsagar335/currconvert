public class CurrencyConvertorController {

@AuraEnabled
    public static double convertAmount(String sourceCurrency,String targetCurrency,String amount){
 HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();
        String todayDate = String.valueOf(System.today());
         String apiKey = System.label.apiLayerApiKey;
         System.debug('-- request--'+apiKey);
        req.setEndpoint(System.label.apiLayerEndpoint+sourceCurrency+'&to='+targetCurrency+'&amount='+amount+'&date='+todayDate);
req.setMethod('GET');
        req.setHeader('apikey',apiKey);
        System.debug('-- request--'+req);
        res = http.send(req);
        System.debug('-- body--'+res.getBody());
         Map<String,Object> responsemap = (Map<String,Object>) JSON.deserializeUntyped(res.getBody());
         return (double) responsemap.get('result');
    }
}