app = app | {}

class AppView extends Backbone.View
  #Bind to existing skeleton
  el: '#todoapp'

  # Template for statatistics
  statsTemplate: _.template( $('#stats-template').html() )

  events:
    'keypress #new-todo': 'createOnEnter'
    'click #clear-completed': 'clearCompleted'
    'click #toggle-all': 'toggleAllCompleted'

  initialize: ->
    #Cache binds
    this.allCheckbox = this.$('#toggle-all')[0]
    this.$input = this.$('#new-todo')
    this.$footer = this.$('#footer')
    this.$main = this.$('#main')

    this.listenTo app.Todos, 'add', this.addOne
    this.listenTo app.Todos, 'reset', this.addAll

    this.listenTo app.Todos, 'change:completed', this.filterOne
    this.listenTo app.Todos, 'filter', this.filterAll
    this.listenTo app.Todos, 'all', this.render

    app.Todos.fetch()

  render: ->
    completed = app.Todos.completed().length
    remaining = app.Todos.remaining().length

    if app.Todos.length
      this.$main.show()
      this.$footer.show()

      this.$footer.html this.statsTemplate
        completed: completed
        remaining: remaining

      this.$('#filters li a')
        .removeClass('selected')
        .filter("[href='#/#{app.TodoFilter || ''}]'")
        .addClass('selected')
    else
      this.$main.hide()
      this.$footer.hide()

    this.allCheckbox.checked = !remaining


  #Add a single todo item to the list by creating a view for it and appending it to the <ul>
  addOne: (todo) ->
    view = new app.TodoView( model: todo)
    $('#todo-list').append( view.render().el )

  #add all items in collection at once
  addAll: ->
    this.$('#todo-list').html('')
    app.Todos.each this.addOne, this

  filterOne: (todo) ->
    todo.trigger('visible')

  filterAll: ->
    app.Todos.each this.filterOne, this

  newAttributes: ->
    {
      title: this.$input.val().trim()
      order: app.Todos.nextOrder()
      completed: false
    }

  createOnEnter: (event) ->
    return if event.which != ENTER_KEY || !this.$input.val().trim()

    app.Todos.create this.newAttributes()
    this.$input.val('')

  clearCompleted: ->
    _.invoke(app.Todos.completed(), 'destroy')
    return false

  toggleAllCompleted: ->
    completed = this.allCheckbox.checked
    app.Todos.each (todo) ->
      todo.save( 'completed': completed )
