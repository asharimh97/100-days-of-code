require "../lib/board"

describe Board do
  let (:board) { described_class.new }

  it 'has empty 6 row and 7 column of board' do
    new_board = Array.new(Board::BOARD_ROW) { Array.new(Board::BOARD_COLUMN, nil) }
    expect(board.board).to eql(new_board)
  end

  it 'create empty board data on `init_board`' do
    new_board = Array.new(Board::BOARD_ROW) { Array.new(Board::BOARD_COLUMN, nil) }
    expect(board.board).to eql(new_board)
  end

  it "clear board data on `clear_board`" do
    current_board = [
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, "x", nil, nil, nil],
      [nil, nil, nil, "x", nil, nil, nil],
      [nil, nil, "y", nil, nil, nil, nil],
    ]
    empty_board = Array.new(Board::BOARD_ROW) { Array.new(Board::BOARD_COLUMN, nil) }

    board.instance_variable_set(:@board, current_board)

    # actions
    board.clear_board

    expect(board.board).to eql(empty_board)
  end

  describe "check winner in board" do
    context "check piece 4 in arrow" do
      piece = "A"
      it "returns `true` when at least 4 consecutive piece" do
        array = ["A", "B", "A", "A", "A", "A", nil]
        result = board.four_in_a_row?(piece, array)
  
        expect(result).to eql(true)
      end
  
      it "return `false` when no 4 consecutive piece" do 
        array = ["A", "B", "A", nil, "A", "B", "A"]
        result = board.four_in_a_row?(piece, array)
  
        expect(result).to eql(false)
      end
    end

    it "returns current row data with value when `horizontal_presence` invoked" do
      current_board = [
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, "x", "x", "x", "x", nil],
        [nil, nil, nil, "x", nil, nil, nil],
        [nil, nil, "y", nil, nil, nil, nil],
      ]

      board.instance_variable_set(:@board, current_board)

      # the level index `0` actually on top but will displayed in bottom
      level = 3

      expected_array = current_board[level]
      array_result = board.horizontal_presence(level)

      expect(array_result).to eql(expected_array)
    end

    it "returns column data non-nil when `vertical_presence` invoked" do
      current_board = [
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, "y", nil, nil, nil],
        [nil, nil, nil, "x", nil, nil, nil],
        [nil, nil, nil, "x", nil, nil, nil],
        [nil, nil, nil, "x", nil, nil, nil],
        [nil, nil, "y", nil, nil, nil, nil],
      ]

      board.instance_variable_set(:@board, current_board)

      column = 3

      expected_array = [nil, "y", "x", "x", "x", nil]
      array_result = board.vertical_presence(column)

      expect(array_result).to eql(expected_array)
    end

    it "returns diagonal data non-nil when `diagonal_down`" do 
      current_board = [
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, "x", "y", nil, nil, nil],
        [nil, nil, nil, "x", nil, nil, nil],
        [nil, nil, nil, "x", "y", nil, nil],
        [nil, nil, nil, "x", nil, nil, nil],
        [nil, nil, "y", nil, nil, "x", "y"],
      ]

      board.instance_variable_set(:@board, current_board)

      column = 3
      level = 2

      array_result = board.diagonal_down_presence(level, column)
      expected_array = [nil, nil, "x", nil, nil, nil]

      expect(array_result).to eql(expected_array)
    end

    it "returns diagonal data non-nil when `diagonal_up`" do 
      current_board = [
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, "x", "y", nil, nil, nil],
        [nil, nil, nil, "x", nil, nil, nil],
        [nil, nil, nil, "x", "y", nil, nil],
        [nil, nil, nil, "x", nil, nil, nil],
        [nil, nil, "y", nil, nil, "x", "y"],
      ]

      board.instance_variable_set(:@board, current_board)

      column = 3
      level = 2

      array_result = board.diagonal_up_presence(level, column)
      expected_array = [nil, "x", "x", "y", nil, "y"]

      expect(array_result).to eql(expected_array)
    end
  end
end