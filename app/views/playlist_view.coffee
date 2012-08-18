jQuery ->
  class window.PlaylistView extends Backbone.View
    template: _.template($("#playlist-template").html())
    tagName: "section"
    className: "playlist"

    events:
      'click .play':'play'
      'click .pause':'pause'
      'click .next':'nextTrack'
      'click .prev':'prevTrack'

    initialize: ->
      _.bindAll(this, 'render', 'renderAlbum', 'queueAlbum', 'updateState', 'updateTrack')

      @collection.bind('add', @renderAlbum)

      @player = @options.player
      @player.bind('change:state', @updateState)
      @player.bind('change:currentTrackIndex', @updateTrack)

      @library = @options.library
      @library.bind('select', @queueAlbum)

      this.createAudio()

    createAudio: ->
      @audio = new Audio()

    render: ->
      $(@el).html(@template(@player.toJSON()))

      this.updateState()

      this

    updateState: ->
      this.updateTrack()

      this.$("button.play").toggle(@player.isStopped())
      this.$("button.pause").toggle(@player.isPlaying())

    updateTrack: ->
      @audio.src = @player.currentTrackUrl()
      if @player.isPlaying()
        @audio.play()
      else
        @audio.pause()

    play: ->
      if @player.playlist.models.length > 0
        @player.play()

        if @player.get('currentTrackIndex') == 0
          this.$('.tracks>li').first().toggleClass('current')

    pause: ->
      @player.pause()

    nextTrack: ->
      @player.nextTrack()

    prevTrack: ->
      @player.prevTrack()

    queueAlbum: (album) ->
      @collection.add(album)

    renderAlbum: (album) ->
      view = new PlaylistAlbumView({
        model: album,
        player: @player,
        playlist: @collection
      })
      this.$('ul').append(view.render().el)
