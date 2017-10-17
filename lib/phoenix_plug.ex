defmodule AlchemetricsWeb.PhoenixPlug do
  @behaviour Plug
  import Plug.Conn
  alias AlchemetricsWeb.MetricMetadata.Request
  alias AlchemetricsWeb.Collectors.PhoenixRequest

  def init(opts), do: opts

  def call(conn, _opts) do
    request_started_at = System.monotonic_time
    
    register_before_send conn, fn conn ->
      metadata = Request.metadata(conn)
      PhoenixRequest.collect(metadata, request_started_at)
      conn
    end
  end
end