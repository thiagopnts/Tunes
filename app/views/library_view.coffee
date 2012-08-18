jQuery ->
  class window.LibraryView extends Backbone.View
    template: _.template $('#library-template').html()
    tagName: 'section'
    className: 'library'

    initialize: ->
      _.bindAll this, 'render'
      @collection.bind 'reset', @render

    render: ->
      collection = @collection

      $(@el).html(@template {})
      $albums = this.$(".albums")
      collection.each (album) ->
        view = new LibraryAlbumView({
          model: album
          collection: collection
        })
        $albums.append(view.render().el)
      this
