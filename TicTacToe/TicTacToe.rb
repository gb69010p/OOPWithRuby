require './Board'
require './Player'

player1 = Player.new('X')
player2 = Player.new('O')
b = Board.new
victory = false

until victory || b.valid_squares.empty?

	b.display_board

	Player.all.each do |player|
		valid = false

		until valid
			square = player.choose_square
			valid = b.valid_square?(square)
			puts "#{square} is already taken, choose another square." unless valid
		end

		b.update_board(player, square)

		b.display_board

		victory =	b.victory?(player)
		break if victory || b.valid_squares.empty?

	end

end

puts "The game ended in a tie." unless victory

