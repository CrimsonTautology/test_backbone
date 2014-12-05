window.app = window.app || {}

class window.app.TodoView extends Backbone.View

  tagName: 'li'

  template: _.template( $('#item-template').html() )

  events:
    'dblclick label': 'edit'
    'keypress .edit': 'updateOnEnter'
    'blur .edit': 'close'

  initialize: ->
    this.listenTo this.model, 'change', this.render

  render: ->
    this.$el.html( this.template(this.model.attributes) )
    this.$input = this.$('.edit')
    this

  edit: ->
    this.$el.addClass 'editing'
    this.$input.focus()

  close: ->
    value = this.$input.val().trim()

    if value
      this.model.save
        title: value

    this.$el.removeClass 'editing'

  updateOnEnter: (e) ->
    if e.which == window.app.ENTER_KEY
      this.close()

console.log window.app
