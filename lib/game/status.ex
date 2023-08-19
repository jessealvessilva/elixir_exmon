defmodule ExMon.Game.Status do
  alias ExMon.Game

  def print_round_message() do
    IO.puts("\n=====The game is started!=====\n")
    IO.inspect( Game.info())
    IO.puts("------------------------------")
  end

  def prin_wrong_message( move ) do

     IO.puts("\n=====Movimento invalido : #{ move } =====\n")
  end
end
