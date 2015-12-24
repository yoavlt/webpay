defmodule Webpay.API do

  def get(url, query \\ []) do
    HTTPoison.start
    query = query
            |> Webpay.Utils.encode_body
    HTTPoison.get!(url, query, Webpay.auth_header).body
    |> Poison.decode!
  end

  def post(url, req_body) do
    HTTPoison.start
    body = req_body
            |> Webpay.Utils.encode_body
    IO.inspect body
    HTTPoison.post!(url, body, Webpay.auth_header).body
    |> Poison.decode!
  end

  def delete(url, body \\ []) do
    HTTPoison.start
    HTTPoison.delete!(url, body, Webpay.auth_header).body
    |> Poison.decode!
  end

end
