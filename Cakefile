{spawn, exec} = require 'child_process'
sys = require 'sys'
blue = '\u001b[34m'
reset = '\033[0m'

task 'app:watch', 'keep watching the files', (options) ->
  console.log blue + "watching app dir" + reset
  runCommand = (name, args...) ->
    proc =           spawn name, args
    proc.stderr.on   'data', (buffer) -> console.log buffer.toString()
    proc.stdout.on   'data', (buffer) -> console.log buffer.toString()
    proc.on          'exit', (status) -> process.exit(1) if status isnt 0
  runCommand 'coffee', '-w','--output','public/js/', '-c', 'app/'

task 'app:compile', 'compiles everything', (options) ->
  console.warn blue + "compiling everything" + reset
  runCommand = (name, args...) ->
    proc =           spawn name, args
    proc.stderr.on   'data', (buffer) -> console.log buffer.toString()
    proc.stdout.on   'data', (buffer) -> console.log buffer.toString()
    proc.on          'exit', (status) -> process.exit(1) if status isnt 0
  runCommand 'coffee', '--output', 'public/js/', '-c', 'app/'
  console.log blue + "done!" + reset

task 'specs:compile', 'compiles all tests', (options) ->
  console.warn blue + "compiling all the tests" + reset
  runCommand = (name, args...) ->
    proc =           spawn name, args
    proc.stderr.on   'data', (buffer) -> console.log buffer.toString()
    proc.stdout.on   'data', (buffer) -> console.log buffer.toString()
    proc.on          'exit', (status) -> process.exit(1) if status isnt 0
  runCommand 'coffee', '-c', 'tests/'
  console.log blue + "done!" + reset

task 'specs:watch', 'watch specs', (options) ->
  console.warn blue + "Watching specs" + reset
  runCommand = (name, args...) ->
    proc =           spawn name, args
    proc.stderr.on   'data', (buffer) -> console.log buffer.toString()
    proc.stdout.on   'data', (buffer) -> console.log buffer.toString()
    proc.on          'exit', (status) -> process.exit(1) if status isnt 0
  runCommand 'coffee', '-wc', 'tests/'
