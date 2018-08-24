defmodule Construct.Types.MixProject do
  use Mix.Project

  def project do
    [
      app: :construct_types,
      version: "0.1.0",
      elixir: "~> 1.3",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: []
    ]
  end

  defp deps do
    [
      {:construct, "~> 1.0"}
    ]
  end
end
