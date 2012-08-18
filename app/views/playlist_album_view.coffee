jQuery ->
  class window.PlaylistAlbumView extends AlbumView
    events:
      'click .queue.remove': 'removeFromPlaylist'
      'click li>a': 'goToTrack'

    initialize: ->
      _.bindAll(this, 'render', 'remove', 'updateState', 'updateTrack')

      @player = @options.player
      @player.bind('change:state', @updateState)
      @player.bind('change:currentTrackIndex', @updateTrack)

      @playlist = @player.playlist

      @model.bind('remove', @remove)

    updateState: ->
      isAlbumCurrent = (@player.currentAlbum() == @model)
      $(@el).toggleClass('current', isAlbumCurrent)

    updateTrack: ->
      isAlbumCurrent = (@player.currentAlbum() == @model)
      if isAlbumCurrent
        currentTrackIndex = @player.get('currentTrackIndex')
        this.$('li').each((index, el) ->
          $(el).toggleClass('current', (index == currentTrackIndex))
        )
      this.updateState()

    removeFromPlaylist: ->
      if @model == @player.currentAlbum()
        
        @player.set({currentAlbumIndex: 0, currentTrackIndex: 0, state: 'stop'})
      else if @playlist.indexOf(@model) < @playlist.indexOf(@player.currentAlbum())
        @player.attributes.currentAlbumIndex -= 1

      @options.playlist.remove(@model)

    goToTrack: (event) ->
      target = $(event.target).parent()

      trackIndex = target.parents('ol').children().index(target)
      albumIndex = @playlist.indexOf(@model)

      @player.set({currentAlbumIndex: albumIndex, currentTrackIndex: trackIndex})

