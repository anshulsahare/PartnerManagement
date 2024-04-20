global class youtubeRequestApi {

    webService static void getYouTubeVideoData(string videoId, String recId){
        system.debug('videoId'+videoId);
        
        string key='AIzaSyA4yPG6-jXlS43WmLruJuIfhntBrtjDVUQ';
        string YoutubeVideoID = videoId;
        
        Http http = new Http();
        Httprequest request = new Httprequest();
        request.setEndpoint('https://youtube.googleapis.com/youtube/v3/videos?part=statistics&id='+YoutubeVideoID+'&key='+key);
        request.setMethod('GET');
        
      HttpResponse response = http.send(request);
        
        system.debug('Request Code= '+response.getStatusCode());
        
        if(response.getStatusCode() == 200){
            JsonParseWrapper objJasonPar = (JsonParseWrapper) JSON.deserialize(response.getBody(), JsonParseWrapper.class);
            system.debug('View count = '+objJasonPar.items[0].statistics.viewCount);
            system.debug('Like count = '+objJasonPar.items[0].statistics.likeCount);
            system.debug('Dislike count = '+objJasonPar.items[0].statistics.dislikeCount);
            system.debug('Favorite count = '+objJasonPar.items[0].statistics.favoriteCount);
            system.debug('Comments count = '+objJasonPar.items[0].statistics.commentCount);
            
            UTube_Video_Infomation__c objUtube = new UTube_Video_Infomation__c();
            objUtube.Id = recId;
            objUtube.View_Count__c = Decimal.valueOf(objJasonPar.items[0].statistics.viewCount);
            objUtube.Like_Count__c = Decimal.valueOf(objJasonPar.items[0].statistics.likeCount);
            if(objJasonPar.items[0].statistics.dislikeCount != null){
            objUtube.Dislike_Count__c = Decimal.valueOf(objJasonPar.items[0].statistics.dislikeCount) ;
            }
           objUtube.Favourite_Count__c = Decimal.valueOf(objJasonPar.items[0].statistics.favoriteCount);
           objUtube.Comment_Count__c = Decimal.valueOf(objJasonPar.items[0].statistics.commentCount);
            
            if(objUtube != null){
            database.update(objUtube, false);  
            }
        }
        
    }
    
    public class JsonParseWrapper{
        public string viewCount{get;set;}
        public list<items> items{get;set;}
        public string kind{get;set;}
    }
    
    public class statistics{
        public string viewCount{get;set;}
        public string likeCount{get;set;}
        public string dislikeCount{get;set;}
        public string favoriteCount{get;set;}
        public string commentCount{get;set;}
    }
    public class items{
        public string id{get;set;}
        public string etag{get;set;}
        public statistics statistics{get;set;}
        public string kind{get;set;}
    }
}