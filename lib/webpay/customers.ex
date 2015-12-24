defmodule Webpay.Customers do
  @moduledoc ~S"""
  customer handler
  """

  defp root_url do
    Webpay.endpoint <> "/v1/customers"
  end

  defp id_url(id) do
    "#{root_url}/#{id}"
  end

  defp delete_card_url(id) do
    "#{id_url(id)}/active_card"
  end

  @doc """
  Create a customer.
  """
  def create(opts) do
    Webpay.API.post(root_url, opts)
  end

  @doc """
  Delete a customer.
  """
  def delete(id) do
    id
    |> id_url
    |> Webpay.API.delete
  end

  @doc """
  fetch list of customers
  """
  def list(opts) do
    Webpay.API.get(root_url, opts)
  end

  @doc """
  Show customer information
  """
  def show(id) do
    id
    |> id_url
    |> Webpay.API.get
  end

  @doc """
  Update customer information
  """
  def update(id, opts) do
    id
    |> id_url
    |> Webpay.API.post(opts)
  end

  @doc """
  Delete customer's active cards
  """
  def delete_active_card(id) do
    id
    |> delete_card_url
    |> Webpay.API.delete
  end

end
