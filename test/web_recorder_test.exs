defmodule WebRecorderTest do
  use ExUnit.Case, async: true
  doctest WebRecorder
  import Mock

  alias TestHelper.Hey

  test "test_name (1)" do
    # with_mock Hey, [get: fn(_url) -> "<html></html>" end] do
    #   a = Hey.get("http://example.com")

    #   # Tests that make the expected call
    #   assert called Hey.get("http://example.com")
    #   assert a ==  "<html></html>"
    # end

    assert Hey.get("a") == "html works"
  end

  test "test_name (2)" do
    # with_mock Hey, [get: fn(_url) -> "<html></html>a" end] do
    #   a = Hey.get("http://example.com")

    #   # Tests that make the expected call
    #   assert called Hey.get("http://example.com")
    #   assert a ==  "<html></html>a"
    # end
    assert Hey.get("a") == "html works"
  end

  test "test_name (3)" do
    # with_mock Hey, [get: fn(_url) -> "<html></html>" end] do
    #   a = Hey.get("http://example.com")

    #   # Tests that make the expected call
    #   assert called Hey.get("http://example.com")
    #   assert a ==  "<html></html>"
    # end
    assert Hey.get("a") == "html works"
  end

  test "test_name (4)" do
    with_mock Hey, [get: fn(_url) -> "<html></html>" end] do
      a = Hey.get("http://example.com")

      # Tests that make the expected call
      assert called Hey.get("http://example.com")
      assert a ==  "<html></html>"
    end
    assert Hey.get("a") == "html works"
  end

  test "test_name (5)" do
    with_mock Hey, [get: fn(_url) -> "<html></html>" end] do
      a = Hey.get("http://example.com")

      # Tests that make the expected call
      assert called Hey.get("http://example.com")
      assert a ==  "<html></html>"
    end
    assert Hey.get("a") == "html works"
  end

  test "test_name (6)" do
    with_mock Hey, [get: fn(_url) -> "<html></html>" end] do
      a = Hey.get("http://example.com")

      # Tests that make the expected call
      assert called Hey.get("http://example.com")
      assert a ==  "<html></html>"
    end
    assert Hey.get("a") == "html works"
  end
end
