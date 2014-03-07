class App.Engine
  position:
    x: 0
    y: 0
    direction: 0

  constructor: (@canvas) ->
    @context = @canvas.getContext '2d'
    $(document).keydown @keyDown

    @player = new App.Sprite @context, 'img/knight.png', @loop

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
    @context.translate @canvas.width/2 + @position.x, @canvas.height/2 + @position.y
    @player.draw @position.direction
    @context.restore()
