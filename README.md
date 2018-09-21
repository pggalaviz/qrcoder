# QRCoder

An Elixir Rust NIF to create SVG QR codes.
It's a wrapper around [qrcode-rust](https://github.com/kennytm/qrcode-rust).

## Installation

You can add this package to your project dependencies:

```elixir
# mix.exs
def deps do
  [
    {:qr_coder, git: "https://github.com/pggalaviz/qrcoder.git"}
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
File..write("/your/path/qrcode.svg", svg)
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