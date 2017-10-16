defmodule AlchemetricsWeb do
  @moduledoc """
  Documentation for AlchemetricsWeb.
  """

  @doc """
  Hello world.

  ## Examples

      iex> AlchemetricsWeb.hello
      :world

  """
  defmacro __using__(_) do
    quote do
      plug AlchemetricsWeb.PhoenixPlug
    end
  end
end