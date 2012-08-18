$(document).ready ->
  jQuery ->
    window.player = new Player()
    window.library = new Albums()
    window.App = new BackboneTunes()
    Backbone.history.start({pushState: true})
