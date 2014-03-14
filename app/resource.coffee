class App.Resource

  constructor: (@context, @path, @callback) ->
    @resource = new Image
    @resource.onload = @callback
    @resource.src = @path


class App.ResourceLoader

  constructor: (@callback, @context) ->
    @resources = []

  queue: (clazz, path) ->
    promise = $.Deferred()
    @resources.push promise
    new clazz @context, path, promise.resolve

  load: ->
    $.when.apply(@, @resources).done @callback
