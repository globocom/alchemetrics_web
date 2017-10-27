defmodule AlchemetricsWeb.MetricMetadata.Request do
  def metadata(conn) do
    
    metadata = 
      {conn.private[:phoenix_controller], conn.private[:phoenix_action]}
      |> case do
        {nil, nil} -> [path_info: "/#{Enum.join(conn.path_info, "/")}"]
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

