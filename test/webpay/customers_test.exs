defmodule Webpay.CustomersTest do
  use ExUnit.Case, async: true
  alias Webpay.Tokens
  alias Webpay.Customers

  setup do
    {:ok, response} = Tokens.create number: "4242-4242-4242-4242", exp_month: 11, exp_year: 2016, cvc: 123, name: "KEI KUBO"
    {:ok, token: response["id"]}
  end

  test "create customer", %{token: token} do
    {:ok, response} = Customers.create [
      card: token
    ]
    assert response["id"]
  end

  test "delete customer", %{token: token} do
    {:ok, response} = Customers.create [
      card: token
    ]
    customer_id = response["id"]

    {:ok, response} = Customers.delete customer_id
    assert response["deleted"]
  end

  test "list of cutomers" do
    {:ok, response} = Customers.list
    assert response["data"]
  end

  test "show customer", %{token: token} do
    {:ok, response} = Customers.create [
      card: token
    ]
    customer_id = response["id"]

    {:ok, response} = Customers.show customer_id
    assert response["object"] == "customer"
  end

  test "delete active card", %{token: token} do
    {:ok, response} = Customers.create [
      card: token
    ]
    customer_id = response["id"]

    {:ok, response} = Customers.delete_active_card customer_id
    refute response["active_card"]
  end

end
