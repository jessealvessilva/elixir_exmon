defmodule ExMon.Game.Actions.Attack do
  alias ExMon.Game

  @move_avg_ower 18..35
  @move_rnd_ower 10..35

  def attack_oponent( opponent, move) do

    demage = calculate_power( move )

    opponent
    |> Game.fetch_player()
    |> Map.get(:life)
    |> calculate_total_life(demage)
    |> update_opponent_life( opponent )
  end
  defp calculate_power( :move_avg), do: Enum.random( @move_avg_ower )
  defp calculate_power( :move_rnd), do: Enum.random( @move_rnd_ower )

  defp calculate_total_life(life, demage ) when life - demage < 0, do: 0
  defp calculate_total_life(life, demage ), do: life - demage

  defp update_opponent_life( life, opponent ) do
    opponent
    |> Game.fetch_player()
    |> Map.put( :life, life )
    |> update_game( opponent )
  end

  defp update_game( player, opponent ) do
    Game.info()
    |> Map.update(opponent , player )
    |> Game.update()
  end

  def teste_attack( opponent ) do
    IO.puts("\n=====vALOR  =====#{opponent } \n")
  end

end
