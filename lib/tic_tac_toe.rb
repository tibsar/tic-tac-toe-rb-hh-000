WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

def valid_move?(board, position)
  move = position.to_i - 1
  if move > 8 || move < 0
    false
  else
     !position_taken?(board, move)
  end
end

def position_taken?(board, position)
  board[position] == "X" || board[position] == "O"
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, position, char="X")
    board[position.to_i-1] = char
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.chomp
  if !valid_move?(board, input)
    puts "Please enter valid input"
    input = gets.chomp
  else
    move(board, input)
    display_board(board)
  end

  def turn_count(board)
    board.select{ |spot| spot == "X" || spot == "O"}.size
  end

  def current_player(board)
    if turn_count(board) % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if position_taken?(board, combo.first) && (board[combo.first] == board[combo[1]]) && (board[combo[1]] == board[combo.last])
      return combo
    end
  end
  false
end

def full?(board)
  board.all?{ |x| x == "X" || x == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  if won?(board)
    board[won?(board).first]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
end
end