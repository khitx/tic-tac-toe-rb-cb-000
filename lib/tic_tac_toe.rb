WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
#  input = gets.strip
  input = gets
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  cnt = 0
  board.each do |pos|
    if (pos == 'X' || pos == 'O')
      cnt += 1
    end
  end
  return cnt
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |wci|
    wci.all? {|i| board[i] == 'X'} ||
    wci.all? {|i| board[i] == 'O'}
  end
#    winX = wci.all? {|i| board[i] == 'X'}
#    winO = wci.all? {|i| board[i] == 'O'}
#    if winX || winO
#      return wci
#    end
#  end
end

def full?(board)
  !board.any? {|i|(i == "" || i == " ")}
#  if (board.any? {|i|(i == "" || i == " ")})
#    return false
#  else
#    return true
#  end
end

def draw?(board)
  full?(board) && !won?(board)
#  if won?(board)
#    return false
#  elsif full?(board)
#    return true
#  else
#    return false
#  end
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
  #if (won?(board) || draw?(board) || full?(board))
  #  return true
  #end
end

def winner(board)
  wrow = won?(board)
  if wrow == nil
    return nil
  else
    return board[wrow[0]]
  end
end

def play(board)
  while !over?(board) == true
#    puts("!over: #{!over?(board)}")
#    puts('1')
#    puts("turn: #{turn(board)}")
    turn(board)
  end
  if won?(board)
    puts("Congratulations #{winner(board)}!")
  elsif draw?(board)
    puts("Cat's Game!")
  end
#  cnt = 1
#  while cnt <= 9
#    turn(board)
#    cnt += 1
#  end
end

#board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
#puts("play: #{play(board)}")
#puts('hello')
