defmodule AlchemetricsWeb.Collectors.Ecto do
    @metadata_type %{type: "database.ecto"}
  
    def collect(ecto_entry) do
      report "query_time", ecto_entry.query_time
      report "queue_time", ecto_entry.queue_time
      Alchemetrics.increment query_count: @metadata_type
    end
  
    defp report(metric_name, value) do
      metadata = metadata_with_name(metric_name)
      to_microseconds(value)
      |> Alchemetrics.report(metadata)
    end

    defp metadata_with_name(name) do 
      @metadata_type 
      |> Map.put(:name, name)
      |> Enum.into([])
    end
  
    defp to_microseconds(nil), do: to_microseconds(0)
    defp to_microseconds(value) do 
      value 
      |> System.convert_time_unit(:native, :microsecond)
    end
  end