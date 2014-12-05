{exec} = require 'child_process'
 
task "default", "build the files", (options) ->
    exec "coffee --compile ex1/js/collections/"
    exec "coffee --compile ex1/js/models/"
    exec "coffee --compile ex1/js/routers/"	
    exec "coffee --compile ex1/js/views/"	
    exec "coffee --compile ex1/js/app.coffee"	

    exec "coffee --compile ex2/js/collections/"
    exec "coffee --compile ex2/js/models/"
    exec "coffee --compile ex2/js/routers/"	
    exec "coffee --compile ex2/js/views/"	
    exec "coffee --compile ex2/js/app.coffee"	
