window.app = window.app || {}

class window.app.BookView extends Backbone.View
  tagName: 'div'
  className: 'bookContainer'
  template: $('#bookTemplate').html()

  render: ->
    tmpl = _.template(@template)
    @$el.html tmpl(@model.toJSON())
    @
