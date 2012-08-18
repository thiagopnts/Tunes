jQuery ->
  class window.AlbumView extends Backbone.View
    template: _.template($("#album-template").html())
    tagName: 'li'
    className: 'album'

    initialize: ->
      _.bindAll(this, 'render')
      @model.bind('change', @render)

    render: ->
      renderContent = @template(@model.toJSON())
      $(@el).html(renderContent)
      this
