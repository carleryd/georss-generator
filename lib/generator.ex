defmodule Generator do

  def start do
    # georss_url = "http://www.forbes.com/real-time/feed2/" #getURL()
    georss_url = getURL()
    IO.puts georss_url
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(georss_url)
    {:ok, feed, _} = FeederEx.parse(body)
    IO.puts body
    Enum.map feed.entries, fn(entry) -> handleEntry(entry) end
  end

  def getURL do
    svd_url = "http://www.svd.se/?service=rss"
    cnn_url = "http://rss.cnn.com/rss/edition.rss"
    rss_url = "http://www.forbes.com/real-time/feed2/"
    georss_url = "http://api.geonames.org/rssToGeoRSS?feedUrl="
      <> svd_url
      <> "&username=roflmao"
  end

  def handleEntry(entry) do
    article = createItem(entry)
  end

  def getImage(entry) do
    if entry.image do
      entry.image
    else
      scraped_article = Scrape.article entry.link
      scraped_article.image
    end
  end

  def populateItem(entry, image_link) do
    item = %Generator.Item{}
    %{ item |
      title: entry.title,
      # description: entry.summary,
      # article_link: entry.link,
      # image_link: image_link
      category: entry.category,
      latitude: entry.latitude
    }
  end

  def createItem(entry) do
    image_link = getImage(entry)
    article = populateItem(entry, image_link)
  end

end
