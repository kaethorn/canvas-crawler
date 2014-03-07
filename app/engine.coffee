class App.Engine
  position:
    x: 0
    y: 0

  constructor: (@canvas) ->
    @context = @canvas.getContext '2d'
    $(document).keydown @keyDown

    @player = new App.Character @context, 'img/knight.png'
    @loop()

  move: (offsetX, offsetY) ->
    @position.x += offsetX
    @position.y += offsetY

  keyDown: (event) =>
    switch event.which
      when 65, 37
        @move -8, 0
      when 87, 38
        @move 0, -8
      when 68, 39
        @move 8, 0
      when 83, 40
        @move 0, 8

  loop: =>
    window.requestAnimationFrame @loop

    @context.save()
    @context.clearRect 0, 0, @canvas.width, @canvas.height
    @context.translate @canvas.width/2 + @position.x, @canvas.height/2 + @position.y
    @player.draw()
    @context.restore()
