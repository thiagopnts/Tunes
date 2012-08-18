class window.Player extends Backbone.Model
  defaults:
    currentAlbumIndex: 0
    currentTrackIndex: 0
    state: 'stop'

  initialize: ->
    @playlist = new Playlist()

  isStopped: ->
    !this.isPlaying()

  isPlaying: ->
    @get('state') == 'play'

  play: ->
    @set({state: 'play'})

  pause: ->
    @set({state: 'pause'})

  nextTrack: ->
    console.log 'next track event'
    if this.currentAlbum().isLastTrack(@get("currentTrackIndex"))
      console.log("it's the last track.")
      if @playlist.isLastAlbum(@get("currentAlbumIndex"))
        console.log "it's the last album"
        @set({currentAlbumIndex: 0})
      else
        @changeAlbum(1)

      @set({currentTrackIndex: 0})
    else
      @changeTrack(1)

  prevTrack: ->
    console.log 'previous track event called'
    if this.currentAlbum().isFirstTrack(@get("currentTrackIndex"))
      if @playlist.isFirstAlbum(@get("currentAlbumIndex"))
        @set({currentAlbumIndex: @playlist.models.length - 1})
        @set({currentTrackIndex: this.currentAlbum().get("tracks").length - 1})
      else
        this.changeAlbum(-1)
        @set({currentTrackIndex: this.currentAlbum().get('tracks').length - 1})
    else
      this.changeTrack(-1)
  
  changeAlbum: (delta) ->
    @set {currentAlbumIndex: @attributes.currentAlbumIndex + delta}

  changeTrack: (delta) ->
    @set {currentTrackIndex: @attributes.currentTrackIndex + delta}

  currentAlbum: ->
    @playlist.at @get("currentAlbumIndex")


  currentTrackUrl: ->
    if this.currentAlbum()
      this.currentAlbum().trackUrlAtIndex(@get('currentTrackIndex'))
