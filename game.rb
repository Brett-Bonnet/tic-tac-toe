class Player
attr_reader :name, :symbol
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

class Board
attr_reader :board_state
  def initialize
    @board_state = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def update(move, symbol)
    @board_state[move-1] = symbol
  end

  def display
    puts " #{@board_state[0]} | #{@board_state[1]} | #{@board_state[2]} "
    puts "---|---|---"
    puts " #{@board_state[3]} | #{@board_state[4]} | #{@board_state[5]} "
    puts "---|---|---"
    puts " #{@board_state[6]} | #{@board_state[7]} | #{@board_state[8]} "
  end

end

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
      player_turn(i)
      
      @number_of_moves += 1
      game_over?(i)
      break if @won
      i += 1
    break if @number_of_moves == 9
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

  def player_turn(counter)
    move = gets.chomp.to_i
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
  end
  
  



end

play = Game.new
