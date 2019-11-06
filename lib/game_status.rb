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
  empty_board = board.all? { |empty| empty == " "}
  WIN_COMBINATIONS.each do |win_combo|
    if empty_board || full?(board)
      return false
    elsif win_combo.all? { |value| board[value] == "X"} || win_combo.all? { |value| board[value] == "O"}
      winner = win_combo
    end
  end
  winner
end

# don't understand how this one line can work for both #full? conditions
def full?(board)
  # all_x = "X"
  # all_o = "O"
  # board.all? { all_x || all_o }
  !board.all? { "X" || "O" }
end


# returns true if the board has not been won but is full,
# false if the board is not won and the board is not full,
# and false if the board is won
def draw?(board)
  !won?(board) && full?(board) ? true : false
end


# def draw?(board)
#   if !won?(board) && full?(board)
#     return true
#   elsif !won?(board) && !full?(board)
#     return false
#   else won?(board)
#     return false
#   end
# end

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




# def won?(board)
#   winner = []
#   empty_board = board.all? { |empty| empty == " "}
#   WIN_COMBINATIONS.each do |win_combo|
#       win_index_1 = win_combo[0]
#       win_index_2 = win_combo[1]
#       win_index_3 = win_combo[2]
#
#       position_1 = board[win_index_1]
#       position_2 = board[win_index_2]
#       position_3 = board[win_index_3]
#
#     if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
#       return win_combo # return the win_combination indexes that won.
#     else
#       return false
#     end
#   end
# end
