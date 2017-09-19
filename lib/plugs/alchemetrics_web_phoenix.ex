defmodule AlchemetricsWeb.Plugs.Phoenix do
  @behaviour Plug
  import Phoenix.Controller
  alias AlchemetricsWeb.MetadataBuilders.Request, as: Metadata
  #alias Plug.Conn

  def init(opts), do: opts

  def call(conn, opts) do
    request_started_at = System.monotonic_time
    Plug.Conn.register_before_send conn, fn conn ->
      Metadata.build(conn)
      |> report fn -> 
        request_duration(request_started_at) 
      end
      conn
    end
  end


  defp request_duration(request_started_at) do
    duration = System.monotonic_time - request_started_at
    duration
    |> System.convert_time_unit(:native, :micro_seconds)
  end

  defp report(metadata, response_time_fn) do
    metric_name = Enum.map(metadata, fn {_k, v} -> v end) |> Enum.join("_")
    Alchemetrics.report metric_name, response_time_fn.(), %{metadata: metadata}
  end
end