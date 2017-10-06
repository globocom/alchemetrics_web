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
  defmacro __using__(repo) do
    quote do
      plug AlchemetricsWeb.PhoenixPlug
      ecto_config = apply(unquote(repo), :config, [])
      loggers = ecto_config[:loggers] || []
      ecto_logger = [{AlchemetricsWeb.MetricCollectors.Ecto, :report_query_metrics, []}]
      Application.put_env ecto_config[:otp_app], unquote(repo), loggers ++ ecto_logger 
    end
  end
end
