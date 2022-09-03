
# GameBoard class contains game board and win logic
class GameBoard
  
  @squares = {1=>'1', 2=>'2', 3=>'3', 4=>'4', 5=>'5', 6=>'6',
              7=>'7', 8=>'8', 9=>'9'}
  
  def self.print_game_board
    
  puts " "
  puts "     #{@squares[1]} |  #{@squares[2]}   | #{@squares[3]}  "
  puts "   ____|______|____   "
  puts "       |      |       "
  puts "     #{@squares[4]} |  #{@squares[5]}   | #{@squares[6]}  "
  puts "   ____|______|____   "
  puts "       |      |       "
  puts "     #{@squares[7]} |  #{@squares[8]}   | #{@squares[9]}  "

  end

  def self.place_marker(marker, number)
    if @squares[number] == 'X' || @squares[number] == 'O'
      puts "That is already occupied. Select another space."
    else
      @squares[number] = marker
    end
    
  end

  def self.check_win
    array = []
    @squares.each do |key,value|
      array.push(value)
    end
    if [array[0],array[1],array[2]].all?('X') || [array[3],array[4],array[5]].all?('X') || 
      [array[6],array[7],array[8]].all?('X') || [array[0],array[3],array[6]].all?('X') || 
      [array[1],array[4],array[7]].all?('X') || [array[2],array[5],array[8]].all?('X') ||
      [array[0],array[4],array[8]].all?('X') || [array[2],array[4],array[6]].all?('X') 

      puts "We have a winner!"
      return true

    elsif [array[0],array[1],array[2]].all?('O') || [array[3],array[4],array[5]].all?('O') || 
      [array[6],array[7],array[8]].all?('O') || [array[0],array[3],array[6]].all?('O') || 
      [array[1],array[4],array[7]].all?('O') || [array[2],array[5],array[8]].all?('O') || 
      [array[0],array[4],array[8]].all?('O') || [array[2],array[4],array[6]].all?('O') 
      puts "We have a winner!"
      return true

    elsif (array.uniq.length == 2)
      puts "The Cat has this game!"
      return true
    end
  end
end

# Player class to instantiate a player
class Player

  def initialize(marker)
    
    @marker = marker
  end


  def choose_marker(marker)
    @marker = marker
  end

  def place_marker
    @marker
  end

  def forfeit
    'I give up!'
  end

end

# function to play a round of tic tac toe 
def play_round(player_string, player_number)
  
  puts "#{player_string} please choose a square"
  while number = gets.chomp.to_i
    break if GameBoard.place_marker(player_number.place_marker, number)
  end
  system ('clear')
  GameBoard.print_game_board
  puts " "
  puts " "
  if GameBoard.check_win
    return
  end
end

# GAMEPLAY BEGINS BELOW

# initial set up assigning X or O to player 1 and 2
puts " "
puts " "
puts 'Will Player 1 be X or O?'
player_one_marker = gets.chomp

player_one_marker == 'X' ? player_two_marker = 'O' : player_two_marker = 'X'
puts "Okay! Player 2 will be #{player_two_marker}"

player_one = Player.new(player_one_marker)
player_two = Player.new(player_two_marker)

won = false

GameBoard.print_game_board
puts " "
puts " "

# Game loop calling 2 instances of play_oround with info for player 1 and then player 2
while !won do
  play_round('Player 1',player_one)
  play_round('Player 2',player_two)
  
end
