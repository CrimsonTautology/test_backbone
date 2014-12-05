app = app || {}

class app.TodoList extends Backbone.Collection
  model: app.Todo

  localStorage: new Backbone.LocalStorage('todos-backbone')

  #Create filter for all completed items
  completed: ->
    this.filter (todo) -> 
      todo.get('completed')

  #Create filter for non-completed items
  remaining: ->
    this.without.apply(this, this.completed())

  nextOrder: ->
    return 1 if !this.length
    this.last().get('order') + 1

  #Sort by insertion order
  comparator: ->
    todo.get('order')

app.Todos = new app.TodoList
