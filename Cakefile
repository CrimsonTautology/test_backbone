{exec} = require 'child_process'
 
task "default", "build the files", (options) ->
    exec "coffee --compile js/collections/"
    exec "coffee --compile js/models/"
    exec "coffee --compile js/routers/"	
    exec "coffee --compile js/views/"	
    exec "coffee --compile js/app.coffee"	
