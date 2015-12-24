defmodule Webpay.TokensTest do
  use ExUnit.Case
  alias Webpay.Tokens

  test "create token" do
    response = Tokens.create number: "4242-4242-4242-4242", exp_month: 11, exp_year: 2016, cvc: 123, name: "KEI KUBO"
    IO.inspect response
    assert response["id"]
  end

end
