require_relative "board"
require_relative "knight"

def knight_moves (start_pos, end_pos)
  knight = Knight.new(start_pos)
  target_spot = nil

  # queue to store current breadth
  q = Array.new
  discovered_steps = []
  found = false
  
  q.push (knight)

  until q.empty? || found do
    current_position = q[0]

    # end position is inside current position's possible moves
    if current_position.moves.include? (end_pos)
      # add the end position with parent of current position
      # end the loop
      found = true
      target_spot = Knight.new(end_pos, current_position)
      break
    end

    current_position.moves.each do |move|
      next_move = Knight.new(move, current_position)
      q.push(next_move)
    end
    
    q.shift
  end

  spots = target_spot
  until spots.nil? do
    discovered_steps.push(spots.position)
    spots = spots.parent
  end

  discovered_steps.reverse!

  board = Board.new 

  board.print_board(discovered_steps)
end

knight_moves([3, 3], [4, 3])