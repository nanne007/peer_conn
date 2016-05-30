defmodule PeerConn.Mixfile do
  use Mix.Project

  def project do
    [app: :peer_conn,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [:logger | applications(Mix.env)]
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :docs},
      {:redix, ">= 0.0.0", only: :test}
    ]
  end

  defp applications(:test) do
    [:redix]
  end
  defp applications(_) do
    []
  end


end
