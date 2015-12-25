defmodule Webpay.API do

  def get(url, query \\ []) do
    HTTPoison.start
    query = Webpay.Utils.encode_body(query)

    unless String.length(query) == 0 do
      url = "#{url}?#{query}"
    end

    HTTPoison.get!(url, Webpay.auth_header)
    |> handle_response
  end

  def post(url, req_body) do
    HTTPoison.start
    body = req_body
            |> Webpay.Utils.encode_body
    IO.inspect body
    HTTPoison.post!(url, body, Webpay.auth_header)
    |> handle_response
  end

  def delete(url, body \\ []) do
    HTTPoison.start
    HTTPoison.delete!(url, body, Webpay.auth_header)
    |> handle_response
  end

  defp handle_response(%HTTPoison.Response{body: body, status_code: code}) when code in 200..299 do
    {:ok, Poison.decode!(body)}
  end

  defp handle_response(%HTTPoison.Response{body: body, status_code: _}) do
    {:error, Poison.decode!(body)["error"]}
  end

end
