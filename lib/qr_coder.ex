defmodule QRCoder do
  @moduledoc """
  Generates an svg binary with given data.
  """

  use Rustler, otp_app: :qr_coder, crate: :qr_coder

  @doc """
  Generate a basic SVG QR Code
  """
  @spec generate_svg(String.t()) :: {:ok, String.t()} | {:error, :invalid}
  def generate_svg(bin) when is_binary(bin) do
    generate_svg(bin, "#000000")
  end

  def generate_svg(_), do: {:error, :invalid}

  @doc """
  Generate an SVG QR Code with custom dark color
  """
  @spec generate_svg(String.t(), String.t()) :: {:ok, String.t()}
  def generate_svg(_, _), do: exit(:nif_not_loaded)
end
