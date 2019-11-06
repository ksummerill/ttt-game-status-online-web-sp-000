require "pry"

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

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

def won?(board)
  winner = []
  empty_board = board.all? { |empty| empty == " " || empty == nil}
  WIN_COMBINATIONS.each do |win_combo|
    # binding.pry
    if win_combo.all? { |value| board[value] == "X"} || win_combo.all? { |value| board[value] == "O"}
      winner = win_combo
      return winner
    end
  end
  return false
end

# check to see if the board is full
def full?(board)
  board.all? { |full| full == "X" || full == "O"}
end

# returns true if the board has not been won but is full,
# false if the board is not won and the board is not full,
# and false if the board is won


def draw?(board)
  # binding.pry
  full?(board) && !won?(board)
  # if !won?(board) && full?(board)
  #   return true
  # elsif !won?(board) && !full?(board)
  #   return false
  # else won?(board)
  #   return false
  # end
end

# returns true if the board has been won, is a draw, or is full.
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

# return the token, "X" or "O" that has won the game given a winning board
def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end
