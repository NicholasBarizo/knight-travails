# frozen_string_literal: true

# Gets path from inputted start to finish
class Knight
  def knight_moves(start, finish)
    puts 'Would you like to see the calculations live? (y/n)'
    show_calc = gets.chomp
    until %w[y n].include? show_calc
      puts 'Would you like to see the calculatinons live? (y/n)'
      show_calc = gets.chomp
    end

    require 'colorize'
    if start == finish
      puts "The knight doesn't need to travel"
      exit
    end
    moves = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
    queue = Array.new [start]
    until queue.empty?
      item = queue[0]
      ShowBoard.new.create_board(item) if show_calc == 'y'
      current_item = item if item.flatten.length == 2
      current_item = item[-1] unless item.flatten.length == 2
      next if item.is_a? Integer

      moves.each do |move|
        new_move = [current_item[0] + move[0], current_item[1] + move[1]]
        next if item.any? { |coord| coord == new_move }
        next unless valid?(new_move)

        ReachEnd.new.show_path(item, new_move) if new_move == finish
        if item.flatten.length == 2
          queue.push [item, new_move]
        else
          queue.push item + [new_move]
        end
      end
      queue.shift
    end
  end

  def valid?(move)
    move[0].between?(1, 8) && move[1].between?(1, 8) ? true : false
  end
end

public

# Displays current path on a chess grid
class ShowBoard
  def create_board(start)
    sleep(1.0/20)
    8.downto(1) do |ind|
      create_row(ind, start)
    end
    puts '   +-------+-------+-------+-------+-------+-------+-------+-------+'
    puts "       A       B       C       D       E       F       G       H\n\n"
  end

  def create_row(row, coords)
    puts '   +-------+-------+-------+-------+-------+-------+-------+-------+'
    puts '   |       |       |       |       |       |       |       |       |'
    print " #{row} |"
    8.times do |column|
      create_cell(row, column + 1, coords)
    end
    puts "\n   |       |       |       |       |       |       |       |       |"
  end

  def create_cell(row, column, coords)
    move = '       '
    pos = [column, row]
    coords.each_with_index do |coord, ind|
      move = "   #{ind}   ".light_yellow if pos == coord
      move = ' Start '.red if ind.zero? && pos == coord
      move = 'Finish '.green if ind == coords.length - 1 && pos == coord
    end
    print "#{move}|"
  end
end

# Shows results when the knight reaches the end
class ReachEnd
  def show_path(start, finish)
    if start.flatten.length == 2
      start = [start, finish]
    else
      start.push finish
    end
    coords = convert_to_coords(start)
    ShowBoard.new.create_board(start)
    puts "The knight reaches its destination in #{start.length - 1} move#{'s' if start.length > 1}. Here is its trail:"
    coords.each_with_index do |coord, ind|
      pos = "Move #{ind}"
      pos = 'Start' if ind == 0
      puts "#{pos}: #{coord.join}"
    end
    exit
  end

  def convert_to_coords(start)
    coord = []
    start.each_with_index do |move, ind|
      coord.push case move[0]
                 when 1 then ['A', move[1]]
                 when 2 then ['B', move[1]]
                 when 3 then ['C', move[1]]
                 when 4 then ['D', move[1]]
                 when 5 then ['E', move[1]]
                 when 6 then ['F', move[1]]
                 when 7 then ['G', move[1]]
                 when 8 then ['H', move[1]]
                 end
      coord[ind][1] = move[1]
    end
    coord
  end
end

Knight.new.knight_moves([8, 8], [1, 1])
