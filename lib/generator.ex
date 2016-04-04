defmodule Generator do

  def start do
    # georss_url = "http://www.forbes.com/real-time/feed2/" #getURL()
    # georss_url = getURL()
    # response = HTTPoison.get(georss_url)
    # body =
    #   case response do
    #     {:ok, http} ->
    #       %HTTPoison.Response{body: body} = http
    #       body
    #     {:error, reason} ->
    #       IO.puts "Failed to parse response: #{reason}"
    #   end

    body = Generator.SampleXml.minimal
    IO.inspect body
    result = FeederEx.parse(body)
    entries =
      case result do
        {:ok, feed, _} ->
          feed.entries
        {:error, reason} ->
          IO.puts "Failed to parse body: #{reason}"
      end

    Enum.map entries, &(handleEntry(&1))
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
      # title: entry.title,
      # description: entry.summary,
      # article_link: entry.link,
      # image_link: image_link,
      category: entry.category,
      latitude: entry.latitude,
      longitude: entry.longitude
    }
  end

  def createItem(entry) do
    image_link = getImage(entry)
    article = populateItem(entry, image_link)
  end

end
