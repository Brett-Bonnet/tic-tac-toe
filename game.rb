

class Player
  attr_reader :name, :symbol
    def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

end

class Board
  def initialize
    @@game_state = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def self.move(symbol, move)
    if !@@game_state[move] == "X" || "O"
      @@game_state[move] = symbol
    end
    print @@game_state
  end
end

class Game
attr_reader :player1, :player2
   
  def initialize
    welcome
    get_players
  end

  def welcome
    puts "Welcome to Tic Tac Toe!"
  end

  def get_players
    puts "Player 1, what is your name?"
    @@player1 = Player.new(gets.chomp, "X")
    puts "Player 2, what is your name?"
    @@player2 = Player.new(gets.chomp, "O")
    puts "#{@@player1.name}(#{@@player1.symbol}) and #{@@player2.name}(#{@@player2.symbol}) are ready to play!"
    Board.new
    Game.play
  end

  def self.play
    
  @counter = 1  
    for @counter in 1..9
      puts "Choose a number [1 - 9]"
      player_move = gets.chomp.to_i
      Board.move(@@player1.symbol, player_move - 1)
    end
  end
end


Game.new

