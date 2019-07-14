

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
    if @@game_state[move] != "X" || @@game_state[move] != "O" 
      @@game_state[move] = symbol
    end
    display
  end
  
  def self.display
    puts "#{@@game_state[0]} | #{@@game_state[1]} | #{@@game_state[2]} "
    puts "--|---|--"
    puts "#{@@game_state[3]} | #{@@game_state[4]} | #{@@game_state[5]} "
    puts "--|---|--"
    puts "#{@@game_state[6]} | #{@@game_state[7]} | #{@@game_state[8]} "
  end

  def self.game_check
    
  end

end

class Game
attr_accessor :player1, :player2
   
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
  current_player = [@@player1, @@player2]  
  i = 0
  counter = 0  
    Board.display
    while counter < 9 do
      if i > 1
        i = 0
      end   
      puts "#{current_player[i].name}, Choose a number [1 - 9]"
      player_move = gets.to_i
      Board.move(current_player[i].symbol, player_move - 1)
      counter += 1
      i += 1
    end
  end
end


Game.new


