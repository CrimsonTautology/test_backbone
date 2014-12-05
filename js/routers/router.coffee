class window.app.Workspace extends Backbone.Router
  routes:
    '*filter': 'setFilter'

  setFilter: (param) ->
    if param
      param = param.trim()

    window.app.TodoFilter = param || ''
    app.Todos.trigger('filter')

window.app.TodoRouter = new window.app.Workspace()
Backbone.history.start()
