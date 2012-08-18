jQuery ->
  class window.LibraryAlbumView extends AlbumView
    events:
      'click .queue.add': 'select'

    select: ->
      @collection.trigger('select', @model)
