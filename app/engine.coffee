class App.Engine
  framerate: 30

  position:
    x: 0
    y: 0

  constructor: (@canvas) ->
    @context = @canvas.getContext '2d'
    window.setInterval @loop, 1000/@frameRate
    $(document).keydown @keyDown

  drawPlayer: ->
    @context.fillStyle = '#dec51b'
    @context.fillRect 4, 4, 8, 8

  movePlayer: (offsetX, offsetY) ->
    @position.x += offsetX
    @position.y += offsetY

  keyDown: (event) =>
    switch event.which
      when 65, 37
        @movePlayer -8, 0
      when 87, 38
        @movePlayer 0, -8
      when 68, 39
        @movePlayer 8, 0
      when 83, 40
        @movePlayer 0, 8

  draw: ->
    @context.save()
    @context.clearRect 0, 0, @canvas.width, @canvas.height
    @context.translate @canvas.width/2 + @position.x, @canvas.height/2 + @position.y
    @drawPlayer()
    @context.restore()

  loop: =>
    @draw()
