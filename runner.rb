require 'java'
require_relative 'lib/pack.jar'
require_relative "start"

java_import "GameRunner"
java_import "GameState"
java_import "Screen"

game = GameRunner.new
game.makeMouseInvisible true
width = game.getGameState.getWidth
height = game.getGameState.getHeight
start = StartScreen.new game.getGameState, width, height
game.getGameState.setCurrentScreen start
game.entryRun
