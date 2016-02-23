defmodule WebRecorder.Mock do
  defmacro __using__(opts) do
    adapter = opts[:adapter] || WebRecorder.Adapter.Hackney
    options = opts[:options]

    quote do
      import WebRecorder.Mock
      :application.start(unquote(adapter).module_name)
      use unquote(adapter)

      def adapter_method,  do: unquote(adapter)
      def options_method,  do: unquote(options)
    end
  end


  @doc """
  Provides macro to trigger recording/replaying http interactions.
  """
  defmacro use_recorded(fixture, options, test) do
    quote do
      recorder = Recorder.start(
        unquote(options) ++ [fixture: normalize_fixture(unquote(fixture)), adapter: adapter_method])

      mock_methods(recorder, adapter_method)

      try do
        [do: return_value] = unquote(test)
        if options_method[:clear_mock] || unquote(options)[:clear_mock] do
          :meck.unload(adapter_method.module_name)
        end
        return_value
      after
        Recorder.save(recorder)
      end
    end
  end

  @doc """
  Mock methods pre-defined for the specified adapter.
  """
  def mock_methods(recorder, adapter) do
    target_methods = adapter.target_methods(recorder)
    module_name    = adapter.module_name

    Enum.each(target_methods, fn({function, callback}) ->
      :meck.expect(module_name, function, callback)
    end)
  end

  @doc """
  Normalize fixture name for using as json file names, which removes whitespaces and align case.
  """
  def normalize_fixture(fixture) do
    fixture |> String.replace(~r/\s/, "_") |> String.downcase
  end
end
