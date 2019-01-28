defmodule Quix.HeaderTest do
  use ExUnit.Case
  alias Quix.Header

  describe "add_long!" do
    test "zero length connection IDs" do
      expected = <<1::1, 0::7, 1::32, 0::4, 0::4, "abc">>

      assert expected == Header.add_long!(<<1::32>>, <<>>, <<>>, "abc")
    end
  end
end
