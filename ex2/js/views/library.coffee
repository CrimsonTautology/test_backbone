window.app = window.app || {}

class window.app.LibraryView extends Backbone.View
  el: '#books'

  initialize: (initialBooks) ->
    @collection = new window.app.Library(initialBooks)
    @render

  render: ->
    @collection.each (item) =>
      @renderBook item
    @

  renderBook: (item) ->
    bookView = new window.app.BookView(model: item)
    @$el.append bookView.render().el

