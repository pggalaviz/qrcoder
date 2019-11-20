# QRCoder

[![Build Status](https://travis-ci.org/pggalaviz/qrcoder.svg?branch=master)](https://travis-ci.org/pggalaviz/qrcoder)

An Elixir Rust NIF to create SVG QR codes.
It's a wrapper around [qrcode-rust](https://github.com/kennytm/qrcode-rust).

## Installation

You can find **QRCoder** in [Hex.pm](https://hex.pm/packages/qr_coder) and you can
add it to your project dependencies:

```elixir
# mix.exs
def deps do
  [
    {:qr_coder, "~> 0.1.0"}
  ]
end
```
## Usage

You can then call the function:

```elixir
{:ok, svg} = QRCoder.generate_svg("Elixir is awesome")
```
This will return a `tuple` where **svg** is black & white svg binary:

![alt text](./examples/basic.svg "Basic QR Code")

You can change the dark color by providing a valid HEX color:

```elixir
{:ok, svg} = QRCoder.generate_svg("Elixir is awesome", "#21ABA5")
```
![alt text](./examples/custom.svg "Custom QR Code")

You can then save it:

```elixir
{:ok, svg} = QRCoder.generate_svg("Elixir is awesome")
File.write("/your/path/qrcode.svg", svg)
```

Or just return the binary:

```elixir
# inside a Phoenix controller
{:ok, svg} = QRCoder.generate_svg("Elixir is awesome")

conn
|> put_resp_header("content-type", "image/svg+xml")
|> put_resp_header("cache-control", "private")
|> send_resp(200, svg)
```
