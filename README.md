# Webpay

Elixir wrapper of [Webpay](https://webpay.jp)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add webpay to your list of dependencies in `mix.exs`:

```elixir
  def deps do
  [{:webpay, "~> 0.0.2"}]
  end
```

  2. Ensure webpay is started before your application:

```elixir
  def application do
  [applications: [:webpay]]
  end
```

  3. Puts config your `config.exs`

```elixir
  config :your_application, :webpay,
  api_key: "your api key"
```

## Usage

```elixir
Webpay.Charges.create [
  amount: 400,
  currency: :jpy,
  card: "card token",
  description: ""
])
```
