defmodule ExMon.Game do
  use Agent

  def start( computer, player ) do

    initial_value = %{ computer: computer, layer: player, turn: :player, status: :started}

    Agent.start_link( fn -> initial_value end, name: __MODULE__)

  end

  def info do
    Agent.get(__MODULE__, & &1  )
  end

  def parar() do
    Agent.stop(__MODULE__)
  end


end
