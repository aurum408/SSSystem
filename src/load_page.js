// load_page.path.push("")
// require("./utils.js");
// require("./main.js");

//import {parse_args, load_page} from "./utils.js";

// require("../js_scripts");


function load_page(url, timeout){
    var page = require('webpage').create();
    page.open(url, function() {

    setTimeout(function() {

        page.evaluate(function() {
            window.document.body.scrollTop = document.body.scrollHeight;
        });

        // var js = page.evaluate(function() {
        //     return document;});
        //
        // console.log(js.all[0].outerHTML);
        // phantom.exit();

    },timeout);

    var js = page.evaluate(function() {
        return document;});

    console.log(js.all[0].outerHTML);
    phantom.exit();

})

}


(function (){

    var url = "https://www.amazon.com/s?i=arts-crafts-intl-ship&bbn=4954955011&rh=n%3A4954955011%2Cn%3A12896081%2Cn%3A12896121&dc&qid=1627957907&rnid=12896081";
    var timeout = 15;

    var name = "None";
    var val = "None";

    var system = require('system');
    const args = system.args;

    args.forEach(function (arg){

        var splitted = arg.split("=");

        if (splitted.length > 1){
            name = splitted[0];
            val = splitted[1];
        }
        else (val = splitted[0]);

        if(name === "--url" || name === "-url"){
            url = val;
        }

        if(name === "--timeout" || name === "-t"){
            timeout = val;
        }
    })

    console.log(url);
    console.log(timeout);

    load_page(url, timeout);

})()