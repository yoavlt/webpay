defmodule Webpay.TokensTest do
  use ExUnit.Case, async: true
  alias Webpay.Tokens

  test "create token" do
    {:ok, response} = Tokens.create number: "4242-4242-4242-4242", exp_month: 11, exp_year: 2016, cvc: 123, name: "KEI KUBO"
    assert response["id"]
  end

end
