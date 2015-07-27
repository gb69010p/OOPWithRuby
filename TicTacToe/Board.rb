class Board

	attr_reader :valid_squares

	WINNING_POSITIONS = [
												[0, 1, 2],
											 	[3, 4, 5],
												[6, 7, 8],
											  [0, 3, 6],
											  [1, 4, 7],
											  [2, 5, 8],
											  [0, 4, 8],
											  [2, 4, 6]
											]

	def initialize
		@board = (1..9).to_a
		@valid_squares = (1..9).to_a
	end

	def display_board
		@board[0..2].each { |square| print "[#{square}]" }
		puts ""
		@board[3..5].each { |square| print "[#{square}]" }
		puts ""
		@board[6..8].each { |square| print "[#{square}]" }
		puts "\n "
	end

	def update_board(player, square)
		@board[square - 1] = player
		@valid_squares.delete(square)
	end

	def valid_square?(square)
		@valid_squares.include?(square)
	end

	def victory?(player)
		victory = false
		player_squares = []

		@board.each_with_index { |square, idx| player_squares << idx if square == player }

		WINNING_POSITIONS.each do |winning|
			victory = true if winning.all? { |square| player_squares.include?(square) }

			if victory
				puts "Player #{player} won!"
				break
			end
		end

		victory
	end


end