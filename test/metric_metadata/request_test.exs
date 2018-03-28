defmodule AlchemetricsWeb.Test.MetricMetadata.Request do
  use ExUnit.Case
  alias AlchemetricsWeb.MetricMetadata.Request

  test "It builds request metric metadata based on controller and action names" do
    fake_conn = %Plug.Conn{
      status: 200,
      method: :get,
      host: "myapi.com",
      port: 80,
      private: %{
        :phoenix_action => :fake_action,
        :phoenix_controller => AlchemetricsWeb.FakeController
      }
    }

    metadata = Request.metadata(fake_conn)

    assert metadata[:controller] == "fake_controller"
    assert metadata[:action] == :fake_action
    assert metadata[:method] == :get
    assert metadata[:host] == "myapi.com"
    assert metadata[:port] == 80
    assert metadata[:http_status_code] == 200
  end

  test "It must be able to create request metric even if there is no routing information in connection (in order to handle 404)" do
    fake_conn = %Plug.Conn{
      status: 404,
      method: :get,
      host: "myapi.com",
      port: 80,
      path_info: ["test", "notfound"]
    }

    metadata = Request.metadata(fake_conn)

    assert metadata[:controller] == :__unknown__
    assert metadata[:action] == :__unknown__
    assert metadata[:method] == :get
    assert metadata[:host] == "myapi.com"
    assert metadata[:port] == 80
    assert metadata[:http_status_code] == 404
  end
end

defmodule AlchemetricsWeb.FakeController do
end
