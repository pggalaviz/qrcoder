defmodule QRCoder.MixProject do
  use Mix.Project

  @version "0.1.2"

  def project do
    [
      app: :qr_coder,
      version: @version,
      description: "A Rust NIF for creating SVG QR codes",
      package: package(),
      source_url: "https://github.com/pggalaviz/qrcoder",
      homepage_url: "https://github.com/pggalaviz/qrcoder",
      elixir: "~> 1.6",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      compilers: [:rustler] ++ Mix.compilers(),
      rustler_crates: rustler_crates(),
      deps: deps(),
      docs: docs()
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
      {:rustler, "~> 0.21.0"},
      # Code Analysis
      {:dialyxir, "~> 1.0.0-rc.4", optional: true, only: [:dev], runtime: false},
      # Docs
      {:ex_doc, "~> 0.21.2", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      name: :qr_coder,
      maintainers: ["Pedro G. Galaviz (hello@pggalaviz.com)"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/pggalaviz/qrcoder"},
      files: ~w(lib priv native/qr_coder/src native/qr_coder/Cargo* .formatter.exs mix.exs README* LICENSE*)
    ]
  end

  defp docs do
    [
      main: "QRCoder",
      source_ref: "v#{@version}",
      canonical: "http://hexdocs.pm/qrcoder",
      source_url: "https://github.com/pggalaviz/qrcoder",
      extras: [
        "README.md"
      ]
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
