# Gtgcrawler

Crawl Guess the Game answers from levelsanswers.com. They only have the answers from 2022 but eh.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `gtgcrawler` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:gtgcrawler, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/gtgcrawler>.

## Running it

Run it by starting an IEx shell and starting the spider:

```shell
$ iex -S mix
iex(1)> Crawly.Engine.start_spider(Gtgcrawler.GtgSpider)
```

The results will appear in `.jl` files in `/tmp`.