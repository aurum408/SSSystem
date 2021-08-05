export function parse_arg(arg){
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

export function parse_args(args){
    var parsed_args = [];

    try{
        args.forEach(function(arg){

        parsed_args.concat([parse_arg(arg)]);
    })
    }catch (err){}


    return parsed_args;
}


export function load_page(url, timeout){
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