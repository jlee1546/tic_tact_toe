

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
    @squares[number] = marker
  end

  def self.check_win
    array = []
    @squares.each do |key,value|
      array.push(value)
    end
    if [array[0],array[1],array[2]].all?('X') || [array[0],array[1],array[2]].all?('O') ||
      [array[3],array[4],array[5]].all?('X') || [array[3],array[4],array[5]].all?('O') ||
      [array[6],array[7],array[8]].all?('X') || [array[6],array[7],array[8]].all?('O') ||
      [array[0],array[3],array[6]].all?('X') || [array[0],array[3],array[6]].all?('O') ||
      [array[1],array[4],array[7]].all?('X') || [array[1],array[4],array[7]].all?('O') ||
      [array[2],array[5],array[8]].all?('X') || [array[2],array[5],array[8]].all?('O') ||
      [array[0],array[4],array[8]].all?('X') || [array[0],array[4],array[8]].all?('O') ||
      [array[2],array[4],array[6]].all?('X') || [array[2],array[4],array[6]].all?('O')
      
      return true
    end
  end
end

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

puts 'Will Player 1 be X or O?'
player_one_marker = gets.chomp

player_two_marker = player_one_marker == 'X' ? 'O' : 'X'
puts "Okay! Player 2 will be #{player_two_marker}"

player_one = Player.new(player_one_marker)
player_two = Player.new(player_two_marker)

won = false

GameBoard.print_game_board

while !won do
  puts 'Player 1 go!'
  number = gets.chomp.to_i

  GameBoard.place_marker(player_one.place_marker, number)
  GameBoard.print_game_board
  break if GameBoard.check_win

  puts 'Player 2 go!'
  number = gets.chomp.to_i
  GameBoard.place_marker(player_two.place_marker,number)
  GameBoard.print_game_board
  break if GameBoard.check_win
  
end



