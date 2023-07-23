defmodule ExMon.Game do
  use Agent

  # def start( computer, player ) do
  def start() do

    # initial_value = %{ computer: computer, layer: player, turn: :player, status: :started}

    Agent.start_link( fn -> %{nome: Jose } end, name: __MODULE__);

  end

  def atualiza() do
    # Agent.update(name: __MODULE__, fn teste -> [12 | [content]] )

    Agent.update( __MODULE__ , fn content -> Map.put_new( content , :c, 1)  end)

  end
  def info do
    Agent.get(__MODULE__, & &1  )
  end

  def parar() do
    Agent.stop(__MODULE__)
  end


end
