
var express = require('express')
  , app = module.exports = express.createServer()
  , port = process.env.PORT || 4000;

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

app.listen(port);
console.log("Express server listening on port %d in %s mode", port, app.settings.env);
