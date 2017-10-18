defmodule AlchemetricsWeb.Test.Collectors.Ecto do
  use ExUnit.Case
  import Mock
  alias AlchemetricsWeb.Collectors.Ecto, as: EctoCollector

  @fake_ecto_entry %{query_time: 2000, queue_time: 1000}
  test_with_mock "It reports ecto query and queue time", Alchemetrics, [:passthrough], [] do
      EctoCollector.collect @fake_ecto_entry

      assert called Alchemetrics.report(2, [name: "query_time", type: "database.ecto"])
      assert called Alchemetrics.report(1, [name: "queue_time", type: "database.ecto"])
      assert called Alchemetrics.increment(query_count: %{type: "database.ecto"})
  end
end
