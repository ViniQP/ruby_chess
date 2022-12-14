module Slideable

  def possible_moves
    moves = []

    directions.each do |d_row, d_column|
      current_row, current_column = location
      # add the location + d_row, d_column to moves
      #   until a piece is hit
      loop do
        current_row += d_row
        current_column += d_column
        location = [current_row, current_column]
        break unless board.in_bounds?(location)

        board.empty?(location) ? moves << location : nil    
        
        if enemy?(location)
          moves << location
          break
        end

        break if ally?(location)
      end
    end
    moves
  end
end