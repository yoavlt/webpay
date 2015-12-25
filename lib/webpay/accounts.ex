defmodule Webpay.Accounts do

  defp account_info_api do
    Webpay.endpoint <> "/v1/account"
  end

  defp delete_all_url do
    Webpay.endpoint <> "/v1/account/data"
  end

  @doc """
  Get webpay account information
  """
  def account_info do
    Webpay.API.get(account_info_api)
  end

  @doc """
  Delete all test data
  """
  def delete_all do
    Webpay.API.delete(delete_all_url)
  end
end
