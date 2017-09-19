defmodule AlchemetricsWeb.Mixfile do
  use Mix.Project


  @description """
  Alchemetrics Web is a boilerplate to report basic metrics for a typical web application, such as request count, response time, ecto and erlang metrics. 
  """
  @project_url "https://github.com/globocom/alchemetrics_web"
  def project do
    [
      app: :alchemetrics_web,
      version: "0.1.0",
      elixir: "~> 1.5",
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

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix, "~> 1.3.0"},
      {:alchemetrics, "~> 0.3"},
      {:ex_doc, ">= 0.0.0", only: :dev}
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end

  defp package do
    [files: ["config", "lib", "mix.exs", "mix.lock", "README.md", "LICENSE"],
     maintainers: ["Globo.com"],
     licenses: ["MIT"],
     links: %{"GitHub" => @project_url},]
  end

end
