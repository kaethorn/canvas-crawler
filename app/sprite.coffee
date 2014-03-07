class App.Sprite extends App.Entity

  frame:        0
  msPerFrame:   180
  lastDrawTime: 0
  delta:        0

  constructor: (@context, @path, @loaded) ->
    @image = new Image

    @image.onload = @loaded

    @image.src = @path

  draw: ->
    if @delta > @msPerFrame
      @delta = 0
      @frame++
      @frame = 0 if @frame > 2
    else
      @delta += Date.now() - @lastDrawTime

    @lastDrawTime = Date.now()
    @context.drawImage @image, @frame*16, 0, 16, 25, 8, 8, 16, 25
