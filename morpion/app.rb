require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib/", __FILE__)

require 'game'
require 'player'
require 'board'

gm = Game.new 
gm.Play
