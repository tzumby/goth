defmodule Goth.Mixfile do
  use Mix.Project

  def project do
    [
      app: :goth,
      version: "0.11.1",
      description: description(),
      package: package(),
      elixirc_paths: elixirc_paths(Mix.env()),
      elixirc_options: [warnings_as_errors: true],
      elixir: "~> 1.4",
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Goth, []},
      applications: [:json_web_token, :logger, :httpoison]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:json_web_token, "~> 0.2.10"},
      {:httpoison, "~> 0.11 or ~> 1.1"},
      {:poison, "~> 2.1 or ~> 3.0"},
      {:bypass, "~> 0.1", only: :test},
      {:mix_test_watch, "~> 0.2", only: :dev},
      {:ex_doc, "~> 0.11.3", only: :dev},
      {:earmark, "~> 0.2", only: :dev},
      {:credo, "~> 0.8", only: [:test, :dev]},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false}
    ]
  end

  defp description do
    """
    A simple library to generate and retrieve Oauth2 tokens for use with Google Cloud Service accounts.
    """
  end

  defp package do
    [
      maintainers: ["Phil Burrows"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/peburrows/goth"}
    ]
  end
end
