defmodule Webpay.Event do
  @moduledoc """
  event handle module
  """

  defp root_url do
    Webpay.endpoint <> "/v1/events"
  end

  defp id_url(id) do
    "#{root_url}/#{id}"
  end

  @doc """
  fetch list of events
  """
  def list(opts) do
    Webpay.get(root_url, opts)
  end

  @doc """
  Show event
  """
  def show(id) do
    id
    |> id_url
    |> Webpay.get
  end

end
