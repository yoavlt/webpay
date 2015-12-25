defmodule ClipServer.AccountsTest do
  use ExUnit.Case

  test "get account info" do
    {:ok, response} = Webpay.Accounts.account_info
    assert response["object"] == "account"
  end

  test "delete all test data" do
    {:ok, response} = Webpay.Accounts.delete_all
    assert response["deleted"]
  end

end
