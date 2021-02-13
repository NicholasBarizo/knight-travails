class Knight
  def initialize(start, finish, up_right, right_up, right_down, down_right, down_left, left_down, left_up, up_left)
    @start = start
    @finish = finish
    @up_right = up_right
    @right_up = right_up
    @right_down = right_down
    @down_right = down_right
    @down_left = down_left
    @left_down = left_down
    @left_up = left_up
    @up_left = up_left
  end
  def move
    @up_right 
  end
end

def knight_moves(start, finish, depth=0)
  moves = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
  best = [0, 0]
  moves.each_with_index do |move, i|
    best[0] = knight_moves([start[0 + move[0]], start[1 + move[1]]], finish, depth + 1) if is_valid?(move)
  end
end

def is_valid?(move)
  move[0] < 1 || move[0] > 8 || move[1] < 1 || move[1] > 8 ? false : true
end

def create_board
  puts "   +-------+-------+-------+-------+-------+-------+-------+-------+\!"
  puts "   |       |       |       |       |       |       |       |       |\!"
  puts " 8 |       |       |       |       |       |       |       |       |\!"
  puts "   |       |       |       |       |       |       |       |       |\!"
  puts "   +-------+-------+-------+-------+-------+-------+-------+-------+\!"
  puts "   |       |       |       |       |       |       |       |       |\!"
  puts " 7 |       |       |       |       |       |       |       |       |\!"
  puts "   |       |       |       |       |       |       |       |       |\!"
  puts "   +-------+-------+-------+-------+-------+-------+-------+-------+\!"
  puts "   |       |       |       |       |       |       |       |       |\!"
  puts " 6 |       |       |       |       |       |       |       |       |\!"
  puts "   |       |       |       |       |       |       |       |       |\!"
  puts "   +-------+-------+-------+-------+-------+-------+-------+-------+\!"
  puts "   |       |       |       |       |       |       |       |       |\!"
  puts " 5 |       |       |       |       |       |       |       |       |\!"
  puts "   |       |       |       |       |       |       |       |       |\!"
  puts "   +-------+-------+-------+-------+-------+-------+-------+-------+\!"
  puts "   |       |       |       |       |       |       |       |       |\!"
  puts " 4 |       |       |       |       |       |       |       |       |\!"
  puts "   |       |       |       |       |       |       |       |       |\!"
  puts "   +-------+-------+-------+-------+-------+-------+-------+-------+\!"
  puts "   |       |       |       |       |       |       |       |       |\!"
  puts " 3 |       |       |       |       |       |       |       |       |\!"
  puts "   |       |       |       |       |       |       |       |       |\!"
  puts "   +-------+-------+-------+-------+-------+-------+-------+-------+\!"
  puts "   |       |       |       |       |       |       |       |       |\!"
  puts " 2 |       |       |       |       |       |       |       |       |\!"
  puts "   |       |       |       |       |       |       |       |       |\!"
  puts "   +-------+-------+-------+-------+-------+-------+-------+-------+\!"
  puts "   |       |       |       |       |       |       |       |       |\!"
  puts " 1 |       |       |       |       |       |       |       |       |\!"
  puts "   |       |       |       |       |       |       |       |       |\!"
  puts "   +-------+-------+-------+-------+-------+-------+-------+-------+\!"
  puts "       A       B       C       D       E       F       G       H\n"
end

create_board