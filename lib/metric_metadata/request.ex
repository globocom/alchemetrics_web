defmodule AlchemetricsWeb.MetricMetadata.Request do
  def metadata(conn) do
    
    metadata = 
      {conn.private[:phoenix_controller], conn.private[:phoenix_action]}
      |> case do
        {nil, nil} -> [controller: :__unknown__, action: :__unknown__]
        {controller, action} -> [controller: format(controller), action: action]
      end
    
    metadata ++ [http_status_code: conn.status]
  end

  defp format(controller) do
    controller
    |> Macro.underscore
    |> String.split("/")
    |> List.last
  end
end

