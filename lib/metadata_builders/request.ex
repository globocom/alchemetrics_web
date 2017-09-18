defmodule AlchemetricsWeb.MetadataBuilders.Request do
  import Phoenix.Controller
  
  def build(conn), do: [
    type: "controller",
    controller: format_controller_name(conn),
    action: action_name(conn)
  ]
  
  defp format_controller_name(conn) do
    conn
    |> controller_module
    |> Macro.underscore
    |> String.split("/")
    |> List.last
  end
end

