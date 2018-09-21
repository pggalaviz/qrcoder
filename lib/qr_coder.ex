defmodule QRCoder do
  @moduledoc """
  Generates an svg binary with given data.
  """

  use Rustler, otp_app: :qr_coder, crate: :qr_coder

  @spec generate_svg(String.t()) :: {:ok, String.t()} | {:error, :invalid}
  def generate_svg(bin) when is_binary(bin) do
    generate_svg(bin, "#000000")
  end

  def generate_svg(_), do: {:error, :invalid}

  @doc """
  Generate SVG QRCode
  ## Example
      iex> QRCoder.generate_svg("Elixir is awesome")
      {:ok, "<svg>...</svg>"}
  """
  @spec generate_svg(String.t(), String.t()) :: {:ok, String.t()}
  def generate_svg(_, _), do: exit(:nif_not_loaded)
end
