defmodule Construct.Types.MixProject do
  use Mix.Project

  def project do
    [
      app: :construct_types,
      version: "0.1.0",
      elixir: "~> 1.3",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Hex
      description: description(),
      package: package(),

      # Docs
      name: "Construct.Types",
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: []
    ]
  end

  defp deps do
    [
      {:construct, "~> 1.0"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp description do
    "Types for Construct"
  end

  defp package do
    [
      name: :construct_types,
      maintainers: ["Yuri Artemev"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/ExpressApp/construct_types"}
    ]
  end

  defp docs do
    [
      main: "readme",
      source_url: "https://github.com/ExpressApp/construct_types",
      extras: ["README.md"]
    ]
  end
end
