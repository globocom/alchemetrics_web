defmodule AlchemetricsWeb.Mixfile do
  use Mix.Project

  @description """
  Alchemetrics Web is a boilerplate to report basic metrics for a typical web application, such as request count, response time, ecto and erlang metrics. 
  """
  @project_url "https://github.com/globocom/alchemetrics_web"
  def project do
    [
      app: :alchemetrics_web,
      version: "0.5.1",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env),
      start_permanent: Mix.env == :prod,
      description: @description,
      source_url: @project_url,
      homepage_url: @project_url,
      package: package(),
      name: "Alchemetrics Web",
      docs: [
        main: "Alchemetrics Web",
        source_url: @project_url
      ],
      deps: deps()
    ]
  end

  def application do
    [
      applications: [:alchemetrics],
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:plug, "~> 1.0"},
      {:alchemetrics, "~> 0.4"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:mock, "~> 0.3.1", only: :test}
    ]
  end

  defp package do
    [files: ["config", "lib", "mix.exs", "mix.lock", "README.md", "LICENSE"],
     maintainers: ["Globo.com"],
     licenses: ["MIT"],
     links: %{"GitHub" => @project_url},]
  end

end
