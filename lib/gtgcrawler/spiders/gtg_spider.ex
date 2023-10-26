defmodule Gtgcrawler.GtgSpider do
  use Crawly.Spider

  @impl Crawly.Spider
  def base_url do
    "https://www.levelsanswers.com"
  end

  @impl Crawly.Spider
  def init() do
    [
      start_urls: [
        "https://www.levelsanswers.com/guess-the-game-daily-puzzle-january-1/"
      ]
    ]
  end

  @impl Crawly.Spider
  def parse_item(response) do
    {:ok, document} =
      response.body |> Floki.parse_document()

    game =
      document
      |> Floki.find(".entry-content ul li")
      |> Floki.text()
      |> String.trim_leading()
      |> String.trim_trailing()

    next_request =
      document
      |> Floki.find(".entry-content a")
      |> Floki.attribute("href")
      |> Crawly.Utils.request_from_url()

    %Crawly.ParsedItem{
      :items => [
        %{game: game, url: response.request_url}
      ],
      :requests =>
        if(
        next_request.url ==
            "https://www.levelsanswers.com/guess-the-game-daily-puzzle-january-1/",
          do: [],
          else: [next_request]
        )
    }
  end
end
