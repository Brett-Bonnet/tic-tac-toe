
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