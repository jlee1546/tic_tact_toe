

class Game
  
  @squares = {1=>' ', 2=>' ', 3=>' ', 4=>' ', 5=>' ', 6=>' ',
              7=>' ', 8=>' ', 9=>' '}
  
  def self.print_game_board
    
  puts " "
  puts "     #{@squares[1]} |   #{@squares[2]}  |  #{@squares[3]}  "
  puts "   ____|______|____   "
  puts "       |      |       "
  puts "     #{@squares[4]} |   #{@squares[5]}  |  #{@squares[6]}  "
  puts "   ____|______|____   "
  puts "       |      |       "
  puts "     #{@squares[7]} |   #{@squares[8]}  |  #{@squares[9]}  "

  end

  def self.change_key(marker, number)
    @squares[number] = marker
  end

  def self.return_squares
    puts @squares
  end
end

Game.print_game_board
Game.change_key('X', 1)
Game.print_game_board
Game.return_squares
Game.change_key('O',5)
Game.print_game_board


