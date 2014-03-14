class App.Sprite extends App.Resource

  frame:        0
  msPerFrame:   180
  lastDrawTime: 0
  delta:        0

  draw: (direction, x, y) ->
    if @delta > @msPerFrame
      @delta = 0
      @frame++
      @frame %= 3
    else
      @delta += Date.now() - @lastDrawTime

    @lastDrawTime = Date.now()
    @context.drawImage @resource, @frame*16, direction*24, 16, 24, x, y, 16, 24
