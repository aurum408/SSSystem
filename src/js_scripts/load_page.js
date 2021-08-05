// load_page.path.push("")
// require("./utils.js");
// require("./main.js");

//import {parse_args, load_page} from "./utils.js";

// require("../js_scripts");


function parse_arg(arg){
    var name = "None";
    var val = "None";

    if(arg.startsWith("--")){
        arg = arg.slice(2);
    }
    if(arg.startsWith("-")){
        arg = arg.slice(1);
    }

    var splitted = arg.split("=")
    if(splitted.size === 1){
        val = splitted[0];
    }
    if (splitted.size === 2){
        name = splitted[0];
        val = splitted[1];
    }

    return [name, val];
}

function parse_args(args){
    var parsed_args = [];

    try{
        args.forEach(function(arg){

        parsed_args.concat([parse_arg(arg)]);
    })
    }catch (err){}
    return parsed_args;
}


function load_page(url, timeout){
    var page = require('webpage').create();
        page.open(url, function() {

    setTimeout(function() {
        // var scrolled = page.content.match(/text="© 1996-2021, Amazon.com, Inc. or its affiliates"/);
        page.evaluate(function() {
            // Scroll to the bottom of page
            window.document.body.scrollTop = document.body.scrollHeight;
        });

        var js = page.evaluate(function() {
            return document;});

        // console.log(url);
        // console.log(timeout);
        console.log(js.all[0].outerHTML);
        // return document.documentElement.outerHTML;
        phantom.exit();
    },timeout);

})

}


(function (){

    var url = "https://www.amazon.com/s?i=arts-crafts-intl-ship&bbn=4954955011&rh=n%3A4954955011%2Cn%3A12896081%2Cn%3A12896121&dc&qid=1627957907&rnid=12896081";
    var timeout = 15;

    console.log(args);
    var system = require('system');
    var args = system.args;

    var name = "None";
    var val = "None";

    console.log(args);

    var parsed_args = parse_args(args);

    console.log(parsed_args);

    parsed_args.forEach(function (item){

    try{

            name = item[0];
            val = item[1];

            if(name === "url" || name === "u"){
                url = val;
            }

            if (name === "timeout" || name === "t" ){
                timeout = val;
            }

        }catch (err){}});

    load_page(url, timeout);

})()