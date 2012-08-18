
class window.BackboneTunes extends Backbone.Router
  routes:
    '' : 'home'
    '/' : 'home'

  initialize: ->
    @playlistView = new PlaylistView({
      collection: window.player.playlist,
      player: window.player,
      library: window.library
    })

    @libraryView = new LibraryView({
      collection: window.library
    })

  home: ->
    $container = $("#container")
    $container.empty()
    $container.append(@playlistView.render().el)
    $container.append(@libraryView.render().el)
