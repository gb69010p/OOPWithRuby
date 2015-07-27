class Player

	@@instances ||= []

	def initialize(name)
		@name = name
		@@instances << self

		puts "Player #{name} created."
	end

	def self.all
		@@instances
	end

	def to_s
		@name
	end

	def choose_square
		puts "Player #{@name}, choose your next square:"
		
		loop do
			square = gets.chomp.to_i

			return square if (1..9).include?(square)

			puts "Please select a valid space (1 - 9):"
		end
	end


end