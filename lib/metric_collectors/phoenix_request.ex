defmodule AlchemetricsWeb.Collectors.PhoenixRequest do
  
  def collect(metadata, request_started_at) do
    report metadata, fn -> 
      request_duration(request_started_at) 
    end
  end

  defp request_duration(request_started_at) do
    duration = System.monotonic_time - request_started_at
    duration
    |> System.convert_time_unit(:native, :micro_seconds)
  end

  @alchemetrics Application.get_env :alchemetrics_web, :alchemetrics, Alchemetrics 
  defp report(metadata, response_time_fn) do
    metric_metadata = Enum.into(metadata, %{})
    @alchemetrics.increment request_count: metric_metadata 
    @alchemetrics.report response_time_fn.(), request_time: metric_metadata 
  end

end