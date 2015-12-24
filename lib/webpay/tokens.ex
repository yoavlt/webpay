defmodule Webpay.Tokens do
  @moduledoc """
  Create webpay card token
  """

  use Webpay.API, method: :post

  defp expected_fields, do: ~w(
    id object livemode created used card
  )

  defp process_url do
    Webpay.endpoint <> "/v1/tokens"
  end

  defp request_body(opts) do
    [
      card: [
        number: opts[:number],
        exp_month: opts[:exp_month],
        exp_year: opts[:exp_year],
        cvc: opts[:cvc],
        name: opts[:name]
      ]
    ]
  end
end
