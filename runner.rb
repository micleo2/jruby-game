require 'java'
require_relative 'lib/pack2.jar'
Dir[Dir.pwd + '/screens/*.rb'].each {|file| require file }

java_import "GameRunner"
java_import "GameState"
java_import "Screen"

game = GameRunner.new
state = game.getGameState
game.makeMouseInvisible true
width = state.getWidth
height = state.getHeight

start = StartScreen.new state, width, height
play = PlayScreen.new state, width, height

state.addScreen start
state.addScreen play
game.entryRun
