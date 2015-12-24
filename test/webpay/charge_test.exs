defmodule Webpay.ChargeTest do
  use ExUnit.Case
  alias Webpay.Charge
  alias Webpay.Tokens

  test "create charge" do
    response = Tokens.create number: "4242-4242-4242-4242", exp_month: 11, exp_year: 2016, cvc: 123, name: "KEI KUBO"
    card_token = response["id"]
    response = Charge.create [
      amount: 400,
      currency: :jpy,
      card: card_token,
      description: ""
    ]
    assert response["id"]
  end

end
