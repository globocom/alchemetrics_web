defmodule AlchemetricsWeb.MetricMetadata.Request do
  def metadata(conn) do 
    {controller, action} = split_route(conn) 
    [
      type: "controller", 
      controller: format(controller), 
      action: action,
      http_status_code: conn.status
    ]
  end
  
  defp split_route(conn) do
    {conn.private[:phoenix_controller], conn.private[:phoenix_action]}
  end

  defp format(conn) do
    conn
    |> Macro.underscore
    |> String.split("/")
    |> List.last
  end
end

