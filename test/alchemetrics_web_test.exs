defmodule AlchemetricsWebTest do
  use ExUnit.Case
  doctest AlchemetricsWeb

  test "greets the world" do
    assert AlchemetricsWeb.hello() == :world
  end
end
