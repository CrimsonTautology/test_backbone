window.app = window.app || {}
window.app.ENTER_KEY = 13

$ ->

  console.log window.app
  #Kick things off by creating the App
  new window.app.AppView()
