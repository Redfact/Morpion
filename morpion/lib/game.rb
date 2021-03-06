require 'player'
require 'board'

require 'colorize'

class Game
	attr_accessor :board , :player1, :player2

	def initialize
		@board  = Board.new
		@player1 = Player.new('vide','O')
		@player2 = Player.new('vide','X')
	end

	def set_players
		print "".center(28)
		print "Player 1".colorize(:green)," : Saisissez votre nom\n"
		print "".center(28)
		input = gets.chomp
		print "".center(28)
		@player1 = Player.new(input,'O')
		print "Player 2".colorize(:green)," : Saisissez votre nom\n"
		print "".center(28)
		input = gets.chomp
		@player2 = Player.new(input,'X')
	end

	def title
		print "------------------------------".colorize(:blue).center(100),"\n"
		puts "Morpion".colorize(:light_green).center(100)
		print "------------------------------".colorize(:blue).center(100),"\n\n"

	end

	def Play
		system "clear"
		title
		set_players
		system "clear"
		title
		board.display_board
		while( !board.win_state  || board.full? ) 
			#Permet de switcher entre le joeurs quand ces derniers ont bien jouer leurs tours
			#Ne switch pas de joeur si le dernier n'a pas saisis un bon input 
			if(board.nb_case.even?)then 
					board.add_case(@player1)
				else
					board.add_case(@player2)
			end
			system "clear"
			title
			board.display_board
		end

		if( board.full?)then msg = "Match nul !" end

		if( board.nb_case.even?)then 
				msg = "#{player2.name} a gagné !"
			else
				msg = "#{player1.name} a gagné !"
		end
		system "clear"
		print "------------------------------".colorize(:blue).center(100),"\n"
		puts msg.colorize(:light_green).center(100)
		print "------------------------------".colorize(:blue).center(100),"\n\n"

	end
end