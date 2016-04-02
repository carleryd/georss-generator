defmodule Generator do

  require Record

  Record.defrecord :xmlElement, Record.extract(:xmlElement,
    from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlText, Record.extract(:xmlText,
    from_lib: "xmerl/include/xmerl.hrl")

  def sample_xml do
    """
<?xml version="1.0" encoding="UTF-8"?>
<rss xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:gml="http://www.opengis.net/gml" xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#" xmlns:georss="http://www.georss.org/georss" xmlns:taxo="http://purl.org/rss/1.0/modules/taxonomy/" xmlns:media="http://search.yahoo.com/mrss" version="2.0">
  <channel>
    <title>Forbes Real Time</title>
    <link>http://www.forbes.com/real-time/</link>
    <description>Forbes Real Time news stream features up-to-date activity throughout Forbes.com. Watch news stories, photo galleries and video content publish in real time.</description>
    <language>en-us</language>
    <copyright>Copyright 2016 Forbes LLC</copyright>
    <dc:language>en-us</dc:language>
    <dc:rights>Copyright 2016 Forbes LLC</dc:rights>
    <item>
      <title>How To Take Advantage Of Facebook's New Emoji "Likes"</title>
      <link>http://www.forbes.com/sites/jaysondemers/2016/03/18/how-to-take-advantage-of-facebooks-new-emoji-likes/</link>
      <description>Never one to shy away from an opportunity to make changes to its platform, Facebook has released a new feature to accentuate its well-known and well-integrated like system. Its known as Facebook reactions and so far, reception among users has been mixed.</description>
      <pubDate>Fri, 18 Mar 2016 17:13:00 GMT</pubDate>
      <guid isPermaLink="false">56ec3642e4b063cb9d020998</guid>
      <dc:creator>Jayson DeMers, Contributor</dc:creator>
      <dc:date>2016-03-18T17:13:00Z</dc:date>
      <content:encoded><![CDATA[Never one to shy away from an opportunity to make changes to its platform, Facebook has released a new feature to accentuate its well-known and well-integrated like system. Its known as Facebook reactions and so far, reception among users has been mixed.]]></content:encoded>
    </item>
    <item>
      <title>America's Students Take Flight: How Innovative Education Is Curing The Pilot Shortage</title>
      <link>http://www.forbes.com/sites/nicholaswyman/2016/03/18/americas-students-take-flight-how-innovative-education-is-curing-the-pilot-shortage/</link>
      <description>Children see glinting planes in the sky and dream of being there, high above the earth, free to travel to distant places. Most of us discard this dream with childhood, however, as there is no clear pathway from our day-to-day lives to a career in aviation. Skills shortages in the aviation [...]</description>
      <pubDate>Fri, 18 Mar 2016 17:02:00 GMT</pubDate>
      <guid isPermaLink="false">56ec2037e4b063cb9d0208ce</guid>
      <dc:creator>Nicholas Wyman, Contributor</dc:creator>
      <dc:date>2016-03-18T17:02:00Z</dc:date>
      <content:encoded><![CDATA[Children see glinting planes in the sky and dream of being there, high above the earth, free to travel to distant places. Most of us discard this dream with childhood, however, as there is no clear pathway from our day-to-day lives to a career in aviation. Skills shortages in the aviation [...]]]></content:encoded>
    </item>
    <item>
      <title>Larry Ellison Becomes World's Fifth Richest Person Ahead Of Jeff Bezos</title>
      <link>http://www.forbes.com/sites/katevinton/2016/03/18/larry-ellison-becomes-worlds-fifth-richest-person-ahead-of-jeff-bezos/</link>
      <description>Oracle Chairman Larry Ellison is having a good week. On Wednesday, he overtook Facebook CEO Mark Zuckerberg to become the world's sixth richest person. Today, he climbed another spot in the ranking of the world's richest people, surpassing Amazon CEO Jeff Bezos by $1 billion to become the world's fifth richest person--and the second richest person in tech behind Bill Gates.</description>
      <category domain="stock-symbol">NASDAQ:AMZN</category>
      <category domain="stock-symbol">NYSE:ORCL</category>
      <pubDate>Fri, 18 Mar 2016 17:00:00 GMT</pubDate>
      <guid isPermaLink="false">56eafc24e4b063cb9d02040e</guid>
      <dc:creator>Kate Vinton, Forbes Staff</dc:creator>
      <dc:date>2016-03-18T17:00:00Z</dc:date>
      <content:encoded><![CDATA[Oracle Chairman Larry Ellison is having a good week. On Wednesday, he overtook Facebook CEO Mark Zuckerberg to become the world's sixth richest person. Today, he climbed another spot in the ranking of the world's richest people, surpassing Amazon CEO Jeff Bezos by $1 billion to become the world's fifth richest person--and the second richest person in tech behind Bill Gates.]]></content:encoded>
      <geo:lat>-3.75</geo:lat>
      <geo:long>-64.5</geo:long>
    </item>
  	</channel>
</rss>
    """
  end

  def breakfast_xml do
    """
    <breakfast_menu>
        <food>
                <name>Belgian Waffles</name>
                <price>$5.95</price>
                <description>Two of our famous Belgian Waffles with plenty of real maple syrup</description>
                <calories>650</calories>
        </food>
        <food>
                <name>Strawberry Belgian Waffles</name>
                <price>$7.95</price>
                <description>Light Belgian waffles covered with strawberries and whipped cream</description>
                <calories>900</calories>
        </food>
        <food>
                <name>Berry-Berry Belgian Waffles</name>
                <price>$8.95</price>
                <description>Light Belgian waffles covered with an assortment of fresh berries and whipped cream</description>
                <calories>900</calories>
        </food>
        <food>
                <name>French Toast</name>
                <price>$4.50</price>
                <description>Thick slices made from our homemade sourdough bread</description>
                <calories>600</calories>
        </food>
        <food>
                <name>Homestyle Breakfast</name>
                <price>$6.95</price>
                <description>Two eggs, bacon or sausage, toast, and our ever-popular hash browns</description>
                <calories>950</calories>
        </food>
    </breakfast_menu>
    """
  end

  alias Generator.Item

  def handle_quotes(string) do
    char_list = to_char_list string

    char_list = Enum.map(
      char_list,
      fn(char) ->
        case char do
          ?“ -> ?"
          ?” -> ?"
          ?‘ -> ?"
          ?’ -> ?"
          _ -> char
        end
      end
    )

    to_string char_list
  end

  def test() do
    # sample_xml
    IO.puts breakfast_xml
    breakfast_xml
    |> scan_text
    # |> handle_quotes
    |> parse_xml
    # { xml, _rest } = :xmerl_scan.string(bitstring_to_list(sample_xml))
    # title = :xmerl_path.string('/result/event/title', xml)
  end

  def scan_text(text) do
    :xmerl_scan.string(String.to_char_list(text))
  end

  def parse_xml({ xml, _ }) do
    # multiple elements
    # elements   = :xmerl_xpath.string('/breakfast_menu//food/name', xml)
    # elements   = :xmerl_xpath.string('/rss/channel//item/geo:lat', xml)
    # elements   = :xmerl_xpath.string('/rss/channel//item/title', xml)
    # IO.inspect elements
    elements   = :xmerl_xpath.string('/rss/channel//food', xml)
    IO.inspect elements
    Enum.each(
      elements,
      fn(element) ->
        IO.puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
        # IO.inspect xmlElement(element, :content)

        [text]     = xmlElement(element, :content)
        IO.inspect text
        # value      = xmlText(text, :value)
        # IO.inspect to_string(text)
      end
    )
  end

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
    # item2 = addCoordinates(item1)
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

  def addCoordinates(item) do
    url = "http://api.geonames.org/rssToGeoRSS?feedUrl=" <>
      "http://www.forbes.com/real-time/feed2/" <>
      "&username=roflmao"
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(url)
    # {:ok, feed, _} = FeederEx.parse(body)
    #
    # added = %{ item | latitude: feed.}
    # IO.inspect body
    body[:title]
  end
end
