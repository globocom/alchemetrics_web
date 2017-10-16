defmodule AlchemetricsWeb.PhoenixPlug do
  @behaviour Plug
  alias AlchemetricsWeb.MetricMetadata.Request
  
  alias AlchemetricsWeb.Collectors.PhoenixRequest
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    request_started_at = System.monotonic_time
    
    register_before_send conn, fn conn ->
      conn
      |> Request.metadata 
      |> PhoenixRequest.collect(request_started_at)

      conn
    end
  end
end