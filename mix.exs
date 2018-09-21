defmodule QRCoder.MixProject do
  use Mix.Project

  def project do
    [
      app: :qr_coder,
      version: "0.1.0",
      elixir: "~> 1.7",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      compilers: [:rustler] ++ Mix.compilers(),
      rustler_crates: rustler_crates(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.18.0"}
    ]
  end

  defp rustler_crates do
    [
      qr_coder: [
        path: "native/qr_coder",
        mode: if(Mix.env() == :prod, do: :release, else: :debug)
      ]
    ]
  end
end
