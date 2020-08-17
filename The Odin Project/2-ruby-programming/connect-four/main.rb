require_relative "./lib/game"

game = Game.new

game.greet_player

play = gets.chomp

if play == "Y"
  game.start_game
else
  game.exit_greeting
end