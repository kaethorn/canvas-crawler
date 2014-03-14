class App.Engine
  position:
    x: 0
    y: 0
    direction: 0

  constructor: (@canvas) ->
    @context = @canvas.getContext '2d'
    $(document).keydown @keyDown

    loader = new App.ResourceLoader @loop, @context
    @player = loader.queue App.Sprite, 'img/knight.png'
    @background = loader.queue App.Tile, 'img/floor-tile.png'
    loader.load()

  move: (offsetX, offsetY, direction) ->
    @position.x += offsetX
    @position.y += offsetY
    @position.direction = direction

  keyDown: (event) =>
    switch event.which
      when 65, 37 # left
        @move -8, 0, 1
      when 87, 38 # up
        @move 0, -8, 2
      when 68, 39 # right
        @move 8, 0, 3
      when 83, 40 # down
        @move 0, 8, 0

  loop: =>
    window.requestAnimationFrame @loop

    @context.save()
    @context.clearRect 0, 0, @canvas.width, @canvas.height
    @background.draw @position.x, @position.y
    @player.draw @position.direction
    @context.restore()
