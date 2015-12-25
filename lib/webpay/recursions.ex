defmodule Webpay.Recursions do

  @moduledoc """
  recursions api handler
  """

  defp root_url do
    Webpay.endpoint <> "/v1/recursions"
  end

  defp id_url(id) do
    "#{root_url}/#{id}"
  end

  defp resume_url(id) do
    "#{id_url(id)}/resume"
  end

  @doc """
  Show recursion
  """
  def show(id) do
    id
    |> id_url
    |> Webpay.API.get
  end

  @doc """
  create recursions
  """
  def create(body) do
    Webpay.API.post(root_url, body)
  end

  @doc """
  resume recursion
  """
  def resume(id, body) do
    id
    |> resume_url
    |> Webpay.API.post(id, body)
  end

  @doc """
  Delete recursion
  """
  def delete(id) do
    id
    |> id_url
    |> Webpay.delete
  end

end
