defmodule AlchemetricsWeb.MetricMetadata.Request do
  def metadata(conn) do
    [
      controller: format_controller(conn.private[:phoenix_controller]),
      action: format_action(conn.private[:phoenix_action]),
      http_status_code: conn.status,
      method: conn.method,
      host: conn.host,
      port: conn.port
    ]
  end

  defp format_controller(nil), do: :__unknown__

  defp format_controller(controller) do
    controller
    |> Macro.underscore()
    |> String.split("/")
    |> List.last()
  end

  defp format_action(nil), do: :__unknown__
  defp format_action(action), do: action
end
