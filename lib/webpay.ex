defmodule Webpay do
  use Application
  use HTTPoison.Base

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
    ]

    opts = [strategy: :one_for_one, name: Webpay.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def endpoint, do: "https://api.webpay.jp"

  def auth_header do
    encoded = Base.encode64(fetch_api_key)
    %{"Authorization" => "Basic " <> encoded,
      "Content-type" => "application/x-www-form-urlencoded"}
  end

  defp config do
    app = Mix.Project.config[:app]
    Application.get_env(app, :webpay)
  end

  defp fetch_api_key do
    config()[:api_key] ||
      System.get_env("WEBPAY_API_KEY")
  end

end
