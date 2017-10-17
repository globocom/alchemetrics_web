defmodule AlchemetricsWeb do
  defmacro __using__(_) do
    quote do
      plug AlchemetricsWeb.PhoenixPlug
    end
  end
end