defmodule ExMon.Game.Actions.Attack do

  @move_avg_ower 18..35
  @move_rnd_ower 10..35

  def attack_oponent( opponent, move) do
    demage = calculate_power( move )
  end
  defp calculate_power( :move_avg), do: Enum.random( @move_avg_ower )
  defp calculate_power( :move_rnd), do: Enum.random( @move_rnd_ower )
end
