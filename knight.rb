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

def knight_moves(start, finish)
  if start == finish
    puts "The knight doesn't need to travel"
    exit
  end
  moves = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
  queue = Array.new [start]
  p queue
  queue.each do |item|
    next if item.is_a? Integer

    p "queue: #{queue} item: #{item}"
    moves.each do |move|
      p "move: #{move}"
      new_move = [item[0] + move[0], item[1] + move[1]]
      next unless valid?(new_move)

      puts "#{new_move}"
      reach_end(start, new_move) if new_move == finish
      # modded_item = 
      queue.push [item[0], new_move]
    end
  end
end

public

def valid?(move)
  move[0].between?(1, 8) && move[1].between?(1, 8) ? true : false
end

def reach_end(start, finish)
  if start.flatten.length == 2
    start = [start, finish]
  else
    start.push finish
  end
  puts "The knight reaches its destination in #{start.length - 1} move#{'s' if start.length == 1}. Here's its trail:"
  start.each_with_index do |move, ind|
    p move
  end
  exit
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

knight_moves([3, 7], [2, 5])
