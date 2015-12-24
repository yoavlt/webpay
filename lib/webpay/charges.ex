defmodule Webpay.Charges do
  @moduledoc ~S"""
  Charge handle module
  """

  def index_url do
    Webpay.endpoint <> "/v1/charges"
  end

  defp show_url(id) do
     index_url <> id
  end

  defp refund_url(id) do
    "#{index_url}/refund"
  end

  defp capture_url(id) do
    "#{index_url}/capture"
  end

  @doc """
  fetch charge list
  """
  def list(opts) do
    index_url
    |> Webpay.API.get
  end

  @doc """
  Show charge info.
  """
  def show(id) do
    id
    |> show_url
    |> Webpay.API.get
  end

  @doc """
  refund charge
  """
  def refund(id, opts) do
    body = refund_body(opts)

    refund_url(id)
    |> Webpay.API.post(body)
  end

  @doc """
  仮売上を実売上にする
  """
  def capture(id, opts) do
    body = capture_body(opts)

    capture_url(id)
    |> Webpay.API.post(body)
  end

  defp refund_body(opts) do
    Keyword.take(opts, [:amount, :uuid])
  end

  defp capture_body(opts) do
    Keyword.take(opts, [:amount])
  end

  defp list_query(opts) do
    keys = ~w(count offset created
       customer shop recursion)
       |> Enum.map(&String.to_atom/1)

    Keyword.take(opts, keys)
  end

end
