defmodule Webpay.Charge do
  @moduledoc ~S"""
  Webpay request and response handler of charge
  """

  defp process_url do
    Webpay.endpoint <> "/v1/charges"
  end

  @doc """
  Create charge

  iex) Webpay.Charge.create([
      amount: 400,
      currency: :jpy,
      card: "card token",
      description: ""
    ])
  """
  def create(opts) do
    body = request_body(opts)

    process_url
    |> Webpay.API.post(body)
  end

  defp request_body(opts) do
    Webpay.Utils.fetch_currency!(opts[:currency])
    opts
  end

end
