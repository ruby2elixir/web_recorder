### just swapping implementation ?
Application.put_env(:some, :adapter, SomeRealAdapter)
defmodule SomeRealAdapter do
  def bla(url) do
    "#{url} - works"
  end
end

defmodule SomeTestAdapter do
  def bla("some") do
    "test impl for some"
  end

  def bla(url) do
    "generic test impl"
  end
end

defmodule Some do
  def bla(url) do
    adapter.bla(url)
  end

  defp adapter do
    Application.get_env(:some, :adapter)
  end
end


Some.bla("some")
Application.put_env(:some, :adapter, SomeTestAdapter)
Some.bla("some")



### other ideas:
  - pre-compile fixtures like tempates in Phoenix into functions(?)
  - even mocking with Meck / Mock has some non-trivial cost (15-50 ms per mock...)
  - maybe don't mock at all?
    - https://groups.google.com/forum/#!topic/elixir-lang-talk/b6oy7DE4h3E
      "For cases like this, I would pass the Math module as argument: "



### Mocking Libs
  - https://vimeo.com/150702113 (Easy Mocking in Elixir with Meck)
  - https://github.com/jjh42/mock
  - https://github.com/eproxus/meck/blob/master/src/meck.erl

  - https://github.com/patrickgombert/mockerator


#### Http clients:
  - https://github.com/edgurgel/httpoison
