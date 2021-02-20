# frozen_string_literal: true

# Modifies the array of positions
module CoordinateModification
  def combine_start_finish(start, finish)
    if start.flatten.length == 2
      start = [start, finish]
    else
      start.push finish
    end
    start
  end
end

# Gets path from inputted start to finish
class Knight
  include CoordinateModification
  def knight_moves(start, finish)
    @finish = finish
    require 'colorize'
    if start == finish
      puts "The knight doesn't need to travel"
      exit
    end
    calculate_moves(start, prompt_show_calculations)
  end

  def calculate_moves(start, show_calc, queue = Array.new([start]))
    @queue = queue
    until @queue.empty?
      @item = @queue[0]
      ShowBoard.new.create_board(@item) if show_calc == 'y'
      @current_item = @item if @item.flatten.length == 2
      @current_item = @item[-1] unless @item.flatten.length == 2
      next if @item.is_a? Integer

      [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]].each { |move| calculate_move(move) }
      @queue.shift
    end
  end

  def calculate_move(move)
    new_move = [@current_item[0] + move[0], @current_item[1] + move[1]]
    return if @item.any? { |coord| coord == new_move }
    return unless valid?(new_move)

    ReachEnd.new.reach_end(combine_start_finish(@item, new_move)) if new_move == @finish
    add_move(new_move)
  end

  def valid?(move)
    move[0].between?(1, 8) && move[1].between?(1, 8) ? true : false
  end

  def prompt_show_calculations
    puts 'Would you like to see the calculations live? (y/n)'
    show_calc = gets.chomp.downcase
    until %w[y n].include? show_calc
      puts 'Would you like to see the calculations live? (y/n)'
      show_calc = gets.chomp.downcase
    end
    show_calc
  end

  def add_move(new_move)
    if @item.flatten.length == 2
      @queue.push [@item, new_move]
    else
      @queue.push @item + [new_move]
    end
    @queue
  end
end

public

# Displays current path on a chess grid
class ShowBoard
  include CoordinateModification
  def create_board(start)
    sleep(1.0/20)
    8.downto(1) { |ind| create_row(ind, start) }
    puts '   +-------+-------+-------+-------+-------+-------+-------+-------+'
    puts "       A       B       C       D       E       F       G       H\n\n"
  end

  def create_row(row, coords)
    puts '   +-------+-------+-------+-------+-------+-------+-------+-------+'
    puts '   |       |       |       |       |       |       |       |       |'
    print " #{row} |"
    8.times { |column| create_cell(row, column + 1, coords) }
    puts "\n   |       |       |       |       |       |       |       |       |"
  end

  def create_cell(row, column, coords, move = '       ', pos = [column, row])
    # p coords
    coords.each_with_index do |coord, ind|
      next unless pos == coord

      move = "   #{ind}   ".light_yellow
      move = ' Start '.red if ind.zero?
      move = 'Finish '.green if ind == coords.length - 1
    end
    print "#{move}|"
  end
end

# Shows results when the knight reaches the end
class ReachEnd
  def reach_end(trail)
    ShowBoard.new.create_board(trail)
    puts "The knight reaches its destination in #{trail.length - 1} move#{'s' if trail.length > 2}. Here is its trail:"
    show_path(convert_to_coords(trail))
    exit
  end

  def show_path(coords)
    coords.each_with_index do |coord, ind|
      pos = "Move #{ind}"
      pos = 'Start' if ind == 0
      puts "#{pos}: #{coord.join}"
    end
  end

  def convert_to_coords(start, possible_x = %w[A B C D E F G H])
    start.map { |move| [possible_x[move[0] - 1], move[1]] }
  end
end


Knight.new.knight_moves([8, 8], [1, 1])
