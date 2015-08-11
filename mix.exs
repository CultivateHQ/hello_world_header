defmodule HelloWorldHeader.Mixfile do
  use Mix.Project

  def project do
    [app: :hello_world_header,
     description: "Demo plug used for tutorial purposes.",
     package: package,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :plug, :cowboy]]
  end

  defp deps do
    [{:cowboy, "~> 1.0"},
     {:plug, "~> 0.14 or ~> 1.0"}]
  end

  defp package do
    [contributors: ["Mark Connell",],
     licenses: ["MIT"],
     links: %{github: "https://github.com/cultivatehq/hello_world_header"},
     files: ~w(lib mix.exs README.md)]
  end
end
