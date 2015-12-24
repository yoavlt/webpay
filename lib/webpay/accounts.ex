defmodule Webpay.Accounts do

  def account_info_api do
    Webpay.endpoint <> "/v1/account"
  end

  def delete_all_url do
    Webpay.endpoint <> "/v1/account/data"
  end

  @doc """
  Get webpay account information
  """
  def get_account_info do
    Webpay.get(account_info_api)
  end

  @doc """
  Delete all test data
  """
  def delete_all do
  end
end
