defmodule AlchemetricsWeb.PhoenixPlug do
  @behaviour Plug
  alias AlchemetricsWeb.MetricMetadata.Request
  
  import AlchemetricsWeb.MetricCollectors.PhoenixRequest
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    request_started_at = System.monotonic_time
    
    register_before_send conn, fn conn ->
      conn
      |> Request.metadata 
      |> report_request_metrics(request_started_at)

      conn
    end
  end
end