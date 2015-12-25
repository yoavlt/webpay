defmodule Webpay.ChargesTest do
  use ExUnit.Case
  alias Webpay.Charges
  alias Webpay.Tokens

  setup do
    {:ok, response} = Tokens.create number: "4242-4242-4242-4242", exp_month: 11, exp_year: 2016, cvc: 123, name: "KEI KUBO"
    {:ok, token: response["id"]}
  end

  test "create charge", %{token: token} do
    {:ok, response} = Charges.create [
      amount: 400,
      currency: :jpy,
      card: token,
      description: ""
    ]
    assert response["id"]
  end

  test "show charge info", %{token: token} do
    {:ok, response} = Charges.create [
      amount: 400,
      currency: :jpy,
      card: token,
      description: ""
    ]
    charge_id = response["id"]
    {:ok, response} = Charges.show(charge_id)
    assert response["id"]
  end

  test "list of charges", %{token: token} do
    {:ok, response} = Charges.list count: 20
    assert Enum.count(response["data"]) <= 20
  end

  test "refund payment", %{token: token} do
    {:ok, response} = Charges.create [
      amount: 400,
      currency: :jpy,
      card: token,
      description: ""
    ]

    charge_id = response["id"]
    {:ok, response} = Charges.refund(charge_id, [
      amount: 300
    ])
    assert response["amount_refunded"] == 300
  end

  test "capture payment", %{token: token} do
    {:ok, response} = Charges.create [
      amount: 400,
      currency: :jpy,
      card: token,
      capture: false,
      description: ""
    ]

    charge_id = response["id"]
    {:ok, response} = Charges.capture(charge_id, [
      amount: 300
    ])
    assert response["amount_refunded"] == 100
  end

end
