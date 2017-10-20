defmodule AlchemetricsWeb.Test.Collectors.PhoenixRequest do
  use ExUnit.Case
  use Test.Support.AlchemetricsMocker
  import Test.Support.AlchemetricsMocker
  alias AlchemetricsWeb.Collectors.PhoenixRequest, as: PhoenixCollector

  describe "Phoenix Request Collector" do
    @fake_metadata [controller: :fake_controller]
    test_with_alchemetrics "reports responsive time and request count" do
      PhoenixCollector.collect @fake_metadata, System.monotonic_time
      assert called Alchemetrics.increment(request_count: expected_metadata())     
      assert called Alchemetrics.report(:_, response_time: expected_metadata())     
    end
  end

  defp expected_metadata, do: @fake_metadata |> Enum.into(%{})
end