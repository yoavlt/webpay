defmodule Webpay.Charges do
  @moduledoc ~S"""
  Charge handle module
  """

  defp root_url do
    Webpay.endpoint <> "/v1/charges"
  end

  defp show_url(id) do
     "#{root_url}/#{id}"
  end

  defp refund_url(id) do
    "#{show_url(id)}/refund"
  end

  defp capture_url(id) do
    "#{show_url(id)}/capture"
  end

  @doc """
  Create charge

  iex) Webpay.Charges.create([
      amount: 400,
      currency: :jpy,
      card: "card token",
      description: ""
    ])
  """
  def create(opts) do
    body = create_body(opts)
    Webpay.API.post(root_url, body)
  end

  @doc """
  fetch charge list

  Optional parameters

  * count(integer) : number of data
  * offset(integer) : offset of data
  * created(timestamp or hash) : filter by created time
  * customer(string) : customer ID
  * shop(string) : show ID
  * recursion(string) : recursion ID

  iex) Webpay.Charges.list count: 20
  %{"count" => 50,
    "data" => [
    ...
    ]}
  """
  def list(opts) do
    root_url
    |> Webpay.API.get(opts)
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

  Optional parameters

  * amount : amount of refund
  * uuid : avoid multiple payments

  iex) Charges.refund(charge_id, [amount: 300])
  {:ok, {"amount" => 400, "amount_refunded" => 300, "captured" => true,
  "card" => %{"country" => "JP", "cvc_check" => "pass", "exp_month" => 11,
  "exp_year" => 2016,
  "fingerprint" => "***",
  "last4" => "4242", "name" => "NAME ONAMAE", "object" => "card",
  "type" => "Visa"}, "created" => 1451032564, "currency" => "jpy",
  "customer" => nil, "description" => "", "expire_time" => nil,
  "failure_message" => nil,
  "fees" => [...],
  "id" => "ch_***", "livemode" => false, "object" => "charge",
  "paid" => true, "recursion" => nil, "refunded" => false}}
  """
  def refund(id, opts) do
    body = refund_body(opts)

    refund_url(id)
    |> Webpay.API.post(body)
  end

  @doc """
  Turn the provisional sales to the actual sales
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

  defp create_body(opts) do
    Webpay.Utils.fetch_currency!(opts[:currency])
    opts
  end

end
