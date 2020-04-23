class Player
	attr_accessor :name, :symb, :state

	def initialize(nm,sym)
		@name = nm
		@symb =sym
		@state=0
	end

	def win
		return state==1
	end
end