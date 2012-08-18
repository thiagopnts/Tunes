class window.Album extends Backbone.Model
  isFirstTrack: (index) ->
    index == 0

  isLastTrack: (index) ->
    return index == (@get('tracks').length - 1)

  trackUrlAtIndex: (index) ->
    if @get("tracks").length >= index
      return @get('tracks')[index].url
    null
