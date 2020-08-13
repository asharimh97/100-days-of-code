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
    context "check horizontally" do
    end
  end
end