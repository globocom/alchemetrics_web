defmodule AlchemetricsWeb.Collectors.PhoenixRequest do

  def collect(metadata, request_started_at) do
    report_request_count(metadata)
    report_response_time metadata, fn ->
      request_duration(request_started_at)
    end
  end

  defp request_duration(request_started_at) do
    duration = System.monotonic_time - request_started_at
    duration
    |> System.convert_time_unit(:native, :microsecond)
  end

  @alchemetrics Application.get_env :alchemetrics, :custom_request_reporter, Alchemetrics
  defp report_request_count(metric_metadata) do
    metric_metadata
    |> metadata(:request_count)
    |> @alchemetrics.increment
  end

  defp report_response_time(metric_metadata, get_response_time_fn) do
    get_response_time_fn.()
    |> @alchemetrics.report(metadata(metric_metadata, :response_time))
  end

  defp metadata(initial_metadata, type) do
    initial_metadata
    |> Keyword.put(:type, type)
    #|> Enum.into(%{})
  end
end