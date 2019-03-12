require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_CONDITIONS = [[1 ,2, 3], [4, 5, 6], [7, 8, 9],
                      [1, 4, 7], [2, 5, 8], [3, 6, 9],
                      [1, 5, 9], [3, 5, 7]]

def display_board(brd)
  system 'clear'
  puts '================='
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "_____|_____|_____"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "_____|_____|_____"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
  puts '================='
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }

  new_board
end

def empty_spaces(brd)
  brd.keys.select { |space| brd[space] == INITIAL_MARKER }
end

def joinor(nums,*optionals)
  if optionals[1]
    return nums[0..-2].join("#{optionals[0]} ").concat(" #{optionals[1]} #{nums[-1]}")
  elsif optionals[0]
    return nums[0..-2].join("#{optionals[0]} ").concat(" or #{nums[-1]}")
  else
    return nums[0..-2].join(", ").concat(" or #{nums[-1]}")
  end
end

def player_places_piece_on!(brd)
  space = ''
  loop {
    puts "Where would you like to place your piece? (#{joinor(empty_spaces(brd))})"
    space = gets.chomp.to_i
    if empty_spaces(brd).include?(space)
      break
    else
      puts "incorrect entry, please try again...idiot"
    end
  }

  brd[space] = PLAYER_MARKER
end

def find_best_square(line,brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select {|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    return nil
  end
end

def computer_places_piece_on!(brd)
  space = nil
  
  WINNING_CONDITIONS.each { |win|
    space = find_best_square(win,brd,PLAYER_MARKER)
    break if space
    
    space = find_best_square(win,brd,COMPUTER_MARKER)
    break if space
  }
  
  if !space
    space = empty_spaces(brd).sample
  end
  
  brd[space] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_spaces(brd).empty?
end

def someone_won?(brd)
  winner = false
  WINNING_CONDITIONS.each { |win|
    if win.all? {|space| player_pieces(brd).include?(space) }
      winner = 'player'
    elsif win.all? { |space| computer_pieces(brd).include?(space) }
      winner = 'computer'
    end
  }

  winner
end

def player_pieces(brd)
  brd.keys.select { |space| brd[space] == PLAYER_MARKER }
end

def computer_pieces(brd)
  brd.keys.select { |space| brd[space] == COMPUTER_MARKER }
end

def alternate_player(curr)
  curr == 'player' ? 'computer' : 'player'
end

def put_piece!(brd, curr)
  curr == 'player' ?
    player_places_piece_on!(brd)
    : computer_places_piece_on!(brd)
end

def game_loop
  board = initialize_board
  player = 0
  computer = 0
  current_player = 'player'

  loop {
    display_board(board)
    loop {
      puts "current score => player: #{player}, computer: #{computer}"
      put_piece!(board,current_player)
      current_player = alternate_player(current_player)
      display_board(board)
      
      break if board_full?(board) || someone_won?(board)
    }
    
    someone_won?(board) == 'player' ? player += 1 : computer += 1
    
    board = initialize_board
    
    break if player == 5 || computer == 5
  }
  
  puts "congrats, #{player > computer ? 'player' : 'computer'} won the game!"
end

loop {
  game_loop

  puts "would you like to play again? (y or n)"
  option = gets.chomp
  break unless option.downcase.start_with?('y')
}

puts "thanks for playing!"
