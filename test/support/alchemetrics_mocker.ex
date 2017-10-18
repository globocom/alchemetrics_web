defmodule Test.Support.AlchemetricsMocker do
  defmacro test_with_alchemetrics(test_name, test_block) do
    quote do
      test_with_mock unquote(test_name), Alchemetrics, [:passthrough], [] do
        unquote(test_block)
      end
    end
  end

  defmacro __using__(_) do
    quote do
      import Mock
    end
  end
end