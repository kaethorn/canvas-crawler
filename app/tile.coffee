class App.Tile extends App.Resource

  draw: ->
    pattern = @context.createPattern @resource, 'repeat'
    @context.fillStyle = pattern
    @context.fillRect 0, 0, 800, 600
