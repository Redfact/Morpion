require 'player'
require 'colorize'


class Board
	attr_accessor :board_case, :nb_case

	def initialize
		@board_case = Array.new(3){ Array.new(3){' '} }
		@nb_case = 0
	end

	def display_board
		@board_case.each{|sub|
			#print @board_case[i],"\n"
			print "         "
			#print "["

			sub.each{|i| print "| #{i} ".colorize(:yellow)}
			puts '|'.colorize(:yellow)
		}
	end

	def add_case(player)
		puts
		print " "*6,player.name.colorize(:light_green)," a vous de jouer ! ","\n"
		input = gets.chomp
		set_board(input,player.symb)
	end

	def set_board(str,symb)
		val = str[0].upcase
		index1=-1
		index2=str[1].to_i
		case val
			when "A"
				index1=0
			when "B"
				index1=1
			when "C"
				index1=2
		end
		#Verfie que les index sont bien compris entre 0 et 2
		if( (0..2).include?(index1) && (1..3).include?(index2) )then
			#Verifie si la case n'est pas déja occupé
			if( !Occupied_case?(index1,index2-1) )then
				@board_case[index1][index2-1] =symb
				#On augmente le nombre de case occupée quand on a bien ajoutée une case
				@nb_case +=1
			end
		end
	end

	#Verifie si une case n'est pas déja occupé
	def Occupied_case?(i,j)
		return !@board_case[i][j].eql?(" ")
	end

	#Verifie si le board est plein
	def full?
		return @nb_case == 9
	end

	#Renvoye vrai quand 3 symboles sont bien allignés 
	def win_state
		return check_diag || check_line || check_col
	end

	def symbol_aligned(i,j)
		sym=@board_case[i][j]
		result = "#{sym}#{sym}#{sym}"
		vert =String.new
		horz =String.new
		obl1 =String.new
		obl2 =String.new

		vert<<@board_case[i][j]<<@board_case[i+1][j]<<@board_case[i+2][j]
		horz<<@board_case[i][j]<<@board_case[i][j+1]<<@board_case[i][j+2]
		obl1<<@board_case[i][j]<<@board_case[i+1][j+1]<<@board_case[i+2][j+3]
		obl2<<@board_case[i][j]<<@board_case[i-1][j-1]<<@board_case[i-2][j-2]
		puts result
		puts vert
		puts horz
		puts obl1
		puts obl2
	end

	#Verifie sy les diagonales ont le memes symbole
	def check_diag
		obl1 =String.new
		obl2 =String.new

		obl1<<@board_case[0][0]<<@board_case[1][1]<<@board_case[2][2]
		obl2<<@board_case[0][2]<<@board_case[1][1]<<@board_case[2][0]

		return obl1.eql?("XXX") || obl1.eql?("OOO") || obl2.eql?("XXX") || obl2.eql?("OOO")
	end	

	def check_line
		obl1 =String.new
		obl2 =String.new
		obl3 =String.new

		obl1<<@board_case[0][0]<<@board_case[0][1]<<@board_case[0][2]
		obl2<<@board_case[1][0]<<@board_case[1][1]<<@board_case[1][2]
		obl3<<@board_case[2][0]<<@board_case[2][1]<<@board_case[2][2]

		return obl1.eql?("XXX") || obl1.eql?("OOO") || obl2.eql?("XXX") || obl2.eql?("OOO") || obl3.eql?("XXX") || obl3.eql?("OOO")
	end

	def check_col
		obl1 =String.new
		obl2 =String.new
		obl3 =String.new

		obl1<<@board_case[0][0]<<@board_case[1][0]<<@board_case[2][0]
		obl2<<@board_case[0][1]<<@board_case[1][1]<<@board_case[2][1]
		obl3<<@board_case[0][2]<<@board_case[1][2]<<@board_case[2][2]

		return obl1.eql?("XXX") || obl1.eql?("OOO") || obl2.eql?("XXX") || obl2.eql?("OOO") || obl3.eql?("XXX") || obl3.eql?("OOO")
	end

end 