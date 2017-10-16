<h1 align="center">Alchemetrics Web</h1>

<p align="center">
  <img alt="Alchemetrics Web" src="https://github.com/globocom/alchemetrics_web/blob/master/assets/alchemetrics_web.png?raw=true" width="128">
</p>

<p align="center">
  Metrics for phoenix and ecto.
</p>

<p align="center">
  <a href="https://travis-ci.org/globocom/alchemetrics_web">
    <img alt="Travis" src="https://travis-ci.org/globocom/alchemetrics_web.svg">
  </a>
  <a href="https://hex.pm/packages/alchemetrics_web">
    <img alt="Hex" src="https://img.shields.io/hexpm/dt/alchemetrics_web.svg">
  </a>
</p>

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `alchemetrics_web` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:alchemetrics_web, "~> 0.3.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/alchemetrics_web](https://hexdocs.pm/alchemetrics_web).

## Usage

1) Add alchemetris_web to your application list in mix.exs file:
```elixir
def application do
  ...
  applications: [:phoenix, ..., :alchemetrics_web]
  ...
end
```

2) Plug AlchemetricsWeb to your endpoint:
```elixir
defmodule MyApp.Endpoint do
  use Phoenix.Endpoint, otp_app: ...
  use AlchemetricsWeb
end
```

3) To collect and report ecto query metrics, config ecto logger in config.exs:

```elixir
config :my_app, MyApp.Repo, ..., 
  loggers: [..., {AlchemetricsWeb.Collectors.Ecto, :collect, []}]
```
