defmodule AlchemetricsWeb.Test.MetricMetadata.Request do
  use ExUnit.Case
  alias AlchemetricsWeb.MetricMetadata.Request

  test "It builds request metric metadata based on controller and action names" do
    fake_conn = %Plug.Conn{
      status: 200,
      private: %{
        :phoenix_action => :fake_action, 
        :phoenix_controller => AlchemetricsWeb.FakeController
      }
    }

    [{_, controller}, {_, action}, {_, http_status_code}] = Request.metadata(fake_conn)   
    
    assert controller == "fake_controller"
    assert action == :fake_action
    assert http_status_code == 200
  end
end

defmodule AlchemetricsWeb.FakeController do
  
end