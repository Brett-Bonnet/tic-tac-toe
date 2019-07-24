
class Game
  def initialize
    @board = Board.new
    @played_moves = [[], []]
    @number_of_moves = 0
    @winning_moves = [
			[1, 2, 3], [4, 5, 6], 
			[7, 8, 9], [1, 4, 7],
			[2, 5, 8], [3, 6, 9],
			[1, 5, 9], [7, 5, 3]
		]
    play
  end

  def display
    @board.display
  end

  def play
    puts "Welcome to Tic-Tac-Toe!"
    get_players
    i = 0
    
    loop do
      display
      if i > 1
        i = 0
      end
      @current_player = @players[i]
      
      puts "#{@current_player.name}, choose a number [1-9] to play!"
      move = gets.chomp.to_i
      if valid_move?(move)
        make_move(i, move)
      else puts "Not a valid move! Try again."
        redo 
      end
      @number_of_moves += 1
      game_over?(i)
    break if @won
      i += 1
    if @number_of_moves == 9 && !@won
      puts "It's a tie!"
      play_again?
    end  
    end
    
  end

  def get_players
     puts "Player 1, what's your name?"
     @player1 = Player.new(gets.chomp, "X")
     puts "Player 2, what's your name?"
     @player2 = Player.new(gets.chomp, "O")
     puts "#{@player1.name}(#{@player1.symbol}) and #{@player2.name}(#{@player2.symbol}) are ready to play!"
     @players = [@player1, @player2]
  end

  def make_move(counter, move)
      @board.update(move, @current_player.symbol)
      @played_moves[counter].push(move)
  end

  def game_over?(counter)
  @won = false
    @winning_moves.each do |array|
      if (array - @played_moves[counter]).empty?
       @won = true
       declare_winner
     end
    end
  end
  
  def declare_winner
    display
    puts "#{@current_player.name} is the winner!"
    play_again?
  end
  
  def valid_move?(move)
    if @played_moves[0].include?(move) || @played_moves[1].include?(move)
      false
    else
      if (1..9) === move
      true
      end
    end  
  end
  
  def play_again?
    puts "Would you like to play again? Type Y/N."
    answer = gets.chomp
    if answer == "Y" || answer == "y"
      new_game = Game.new
    elsif answer == "N" || answer == "n"
      puts "Thanks for playing! See ya next time!" 
      exit
    end
  end
end