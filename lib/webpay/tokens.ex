defmodule Webpay.Tokens do
  @moduledoc """
  Create webpay card token
  """

  @doc """
  Create a token of payment card
  """
  def create(opts) do
    body = request_body(opts)
    Webpay.API.post(process_url, body)
  end

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
