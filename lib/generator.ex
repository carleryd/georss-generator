defmodule Generator do

  def start() do
    # url = "http://www.svd.se/?service=rss"
    url = "http://www.forbes.com/real-time/feed2/"
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(url)
    {:ok, feed, _} = FeederEx.parse(body)

    # IO.puts feed.entries
    Enum.map feed.entries, fn(entry) -> handleEntry(entry) end
  end

  def handleEntry(entry) do
    article = createItem(entry)
  end

  # Handle each item from feed
  def createItem(entry) do
    item = %Generator.Item{}

    image_link =
    if entry.image do
      entry.image
    else
      scraped_article = Scrape.article entry.link
      scraped_article.image
    end

    article = %{ item | title: entry.title,
    summary: entry.summary,
    article_link: entry.link,
    image_link: image_link }
  end

end
