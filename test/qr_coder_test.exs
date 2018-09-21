defmodule QRCoderTest do
  use ExUnit.Case

  test "Generates an SVG" do
    assert {:ok, _svg} = QRCoder.generate_svg("Elixir is awesome")
  end

  test "Generates an SVG with custom color." do
    assert {:ok, _svg} = QRCoder.generate_svg("Elixir is awesome", "#21ABA5")
  end
end
