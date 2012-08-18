
var express = require('express');

var app = module.exports = express.createServer();

app.configure(function(){
  //'custom' template engine for pure html
  app.register('.html', {
      compile: function(str, options){
        return function(locals){
          return str;
        };
      }
    });
  app.set("view options", {layout: false});
  app.set('views', __dirname + '/public');
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(app.router);
  app.use(express.static(__dirname + '/public'));
});

app.configure('development', function(){
  app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));
});

app.configure('production', function(){
  app.use(express.errorHandler());
});

// Routes

app.get('/', function(req, res) {
  res.render("index.html");
});

app.listen(9345);
console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env);
