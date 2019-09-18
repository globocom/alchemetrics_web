defmodule AlchemetricsWeb.Test.Collectors.PhoenixRequest do
  use ExUnit.Case
  use Test.Support.AlchemetricsMocker
  import Test.Support.AlchemetricsMocker
  alias AlchemetricsWeb.Collectors.PhoenixRequest, as: PhoenixCollector

  describe "Phoenix Request Collector" do
    @fake_metadata [controller: :fake_controller]
    test_with_alchemetrics "reports responsive time and request count" do
      PhoenixCollector.collect @fake_metadata, System.monotonic_time
      assert called Alchemetrics.increment(expected_metadata(:request_count))
      assert called Alchemetrics.report(:_, expected_metadata(:response_time))
    end
  end

  defp expected_metadata(type), do: [type: type] ++ @fake_metadata
end