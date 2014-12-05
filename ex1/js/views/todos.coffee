window.app = window.app || {}

class window.app.TodoView extends Backbone.View

  tagName: 'li'

  template: _.template( $('#item-template').html() )

  events:
    'click .toggle': 'togglecompleted'
    'dblclick label': 'edit'
    'click .destroy': 'clear'
    'keypress .edit': 'updateOnEnter'
    'blur .edit': 'close'

  initialize: ->
    this.listenTo this.model, 'change', this.render
    this.listenTo this.model, 'destroy', this.remove
    this.listenTo this.model, 'visible', this.toggleVisible

  render: ->
    this.$el.html( this.template(this.model.attributes) )

    this.$el.toggleClass 'completed', this.model.get('completed')
    this.toggleVisible()

    this.$input = this.$('.edit')
    this

  toggleVisible: ->
    this.$el.toggleClass 'hidden', this.isHidden()

  isHidden: ->
    isCompleted = this.model.get('completed')
    (!isCompleted && window.app.TodoFilter == 'completed') || (isCompleted && window.app.TodoFilter == 'active')

  togglecompleted: ->
    this.model.toggle()

  edit: ->
    this.$el.addClass 'editing'
    this.$input.focus()

  close: ->
    value = this.$input.val().trim()

    if value
      this.model.save
        title: value
    else
      this.clear()

    this.$el.removeClass 'editing'

  updateOnEnter: (e) ->
    if e.which == window.app.ENTER_KEY
      this.close()

  clear: ->
    this.model.destroy()
