window.app = window.app || {}

class window.app.TodoList extends Backbone.Collection
  model: window.app.Todo

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
  comparator: (todo) ->
    todo.get('order')

window.app.Todos = new window.app.TodoList
console.log window.app
