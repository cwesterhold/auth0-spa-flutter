ahistory.pushState = ( f => function pushState(){
     if (arguments[2] == "#/") {
         var url = window.location
         var urlString = url.protocol + "//" + url.host + "/#" + url.pathname + url.search
         console.log(urlString)
         arguments[2] = urlString;
         console.log("FIXING PUSH");
     }

     var ret = f.apply(this, arguments);
     return ret;
 })(history.pushState);

 history.replaceState = ( f => function replaceState(){

     if (arguments[2] == "#/") {
         var url = window.location
         var urlString = url.protocol + "//" + url.host + "/#" + url.pathname + url.search
         console.log(urlString)
         arguments[2] = urlString;
         console.log("FIXING REPLACE");
     }

     var ret = f.apply(this, arguments);
     return ret;
 })(history.replaceState);