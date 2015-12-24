defmodule Webpay.Customers do
  @moduledoc ~S"""
  customer handler
  """

  def create_url do
    Webpay.endpoint <> "/v1/customers"
  end

  def create(opts) do
  end

end
