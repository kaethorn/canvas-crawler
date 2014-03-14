class App.Tile extends App.Resource

  draw: (x, y) ->
    pattern = @context.createPattern @resource, 'repeat'
    @context.fillStyle = pattern
    @context.fillRect -x, -y, 800, 600
