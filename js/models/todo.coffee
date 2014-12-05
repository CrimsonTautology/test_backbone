app = app || {}

class app.Todo extends Backbone.Model

  defaults:
    title: ''
    completed: false

  #Toggle completed status 
  toggle: ->
    this.save
      completed: !this.get('completed')
