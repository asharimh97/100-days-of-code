require_relative "../lib/player"

describe Player do
  # bikin kaya player = Player.new tapi biar bisa dipake di 1 block
  let (:player) { described_class.new("John Doe", "A") }

  it 'has John Doe as name' do
    expect(player).to have_attributes(name: "John Doe")
  end

  it 'has piece of `A`' do
    expect(player).to have_attributes(piece: "A")
  end
end