defmodule ExMon.Game.Actions.Attack do
  alias ExMon.Game
  alias ExMon.Game.Status

  @move_avg_ower 18..35
  @move_rnd_ower 10..35

  def attack_oponent( opponent, move) do

    demage = calculate_power( move )
    opponent
    |> Game.fetch_player()
    |> Map.get(:life)
    |> calculate_total_life(demage)
    |> update_opponent_life( opponent, demage )
  end
  defp calculate_power( :move_avg), do: Enum.random( @move_avg_ower )
  defp calculate_power( :move_rnd), do: Enum.random( @move_rnd_ower )

  defp calculate_total_life(life, demage ) when life - demage < 0, do: 0
  defp calculate_total_life(life, demage ), do: life - demage

  defp update_opponent_life( life, opponent, damage ) do
    opponent
    |> Game.fetch_player()
    |> Map.put( :life, life )
    |> update_game( opponent, damage )
  end

  defp update_game( player, opponent, damage ) do
    Game.info()
    |> Map.put(opponent , player )
    |> Game.update()

    Status.print_move_message( opponent, :attack, damage)
  end

  def teste_attack( opponent ) do
    IO.puts("\n=====vALOR  =====#{opponent } \n")
  end

end
