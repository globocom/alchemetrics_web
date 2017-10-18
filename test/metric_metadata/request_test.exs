defmodule AlchemetricsWeb.Test.MetricMetadata.Request do
  use ExUnit.Case
  alias AlchemetricsWeb.MetricMetadata.Request

  test "It builds request metric metadata based on controller and action names" do
    fake_conn = %Plug.Conn{
      private: %{
        :phoenix_action => :fake_action, 
        :phoenix_controller => AlchemetricsWeb.FakeController
      }
    }

    [{_, type}, {_, controller}, {_, action}] = Request.metadata(fake_conn)    
    
    assert type == "controller"
    assert controller == "fake_controller"
    assert action == :fake_action
  end
end

defmodule AlchemetricsWeb.FakeController do
  
end