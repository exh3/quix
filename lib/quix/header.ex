defmodule Quix.Header do
  @moduledoc """
  Add header to a QUIC packet, or parse a QUIC packet with header.
  """

  def add_long!(version, dest_id, src_id, body, extra_seven \\ <<0::7>>) do
    <<
      1::1,
      extra_seven::bitstring,
      version::binary,
      id_length(dest_id)::4,
      id_length(src_id)::4,
      dest_id::binary,
      src_id::binary,
      body::bitstring
    >>
  end

  def add_short() do
  end

  def parse() do
  end

  defp id_length(connection_id) do
    case byte_size(connection_id) do
      0 -> 0
      size -> size - 3
    end
  end
end
