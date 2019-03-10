INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_CONDITIONS = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,9]]

def display_board(brd)
  system 'clear'
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "_____|_____|_____"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "_____|_____|_____"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
end

def initialize_board
  new_board = {}
  (1..9).each {|num| new_board[num] = INITIAL_MARKER }
  
  new_board
end

def empty_spaces(brd)
  brd.keys.select {|space| brd[space] == INITIAL_MARKER }
end

def player_places_piece_on!(brd)
  space = ''
  loop {
    puts "Where would you like to place your piece? (#{empty_spaces(brd).join(', ')})"
    space = gets.chomp.to_i
    if empty_spaces(brd).include?(space)
      break
    else
      puts "incorrect entry, please try again...idiot"
    end
  }
  
  brd[space] = PLAYER_MARKER
end

def computer_places_piece_on!(brd)
  space = empty_spaces(brd).sample
  brd[space] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_spaces(brd).empty?
end

def someone_won?(brd)
  winner = false
  WINNING_CONDITIONS.each {|win|
    if win.all? {|space| player_pieces(brd).include?(space) }
      winner = 'player'
    elsif win.all? {|space| computer_pieces(brd).include?(space) }
      winner = 'computer'
    end
  }
  
  winner
end

def player_pieces(brd)
  brd.keys.select {|space| brd[space] == PLAYER_MARKER}
end

def computer_pieces(brd)
  brd.keys.select {|space| brd[space] == COMPUTER_MARKER}
end

def game_loop(board)
  display_board(board)
  loop {
    player_places_piece_on!(board)
    computer_places_piece_on!(board)
    display_board(board)
    
    break if board_full?(board) || someone_won?(board)
  }
  puts "congrats, #{someone_won?(board)} won the game!"
end

loop {
  board = initialize_board
  game_loop(board)
  
  puts "would you like to play again? (y or n)"
  option = gets.chomp
  break unless option.downcase.start_with?('y')
}

puts "thanks for playing!"