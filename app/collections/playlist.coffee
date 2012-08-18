class window.Playlist extends Albums
  isFirstAlbum: (index) ->
    index == 0

  isLastAlbum: (index) ->
    index == (@models.length - 1)

  indexOf: (model) ->
    @models.indexOf(model)
