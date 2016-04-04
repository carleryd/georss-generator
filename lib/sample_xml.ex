defmodule Generator.SampleXml do

  def minimal do
    """
    <?xml version="1.0" encoding="UTF-8"?>
    <rss xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:gml="http://www.opengis.net/gml" xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#" xmlns:georss="http://www.georss.org/georss" xmlns:taxo="http://purl.org/rss/1.0/modules/taxonomy/" xmlns:media="http://search.yahoo.com/mrss" version="2.0">
    <channel>
    <title>SvD</title>
    <link>http://www.svd.se/</link>
    <description>Main page from www.svd.se</description>
    <language>en</language>
    <copyright>SvD 2016</copyright>
    <pubDate>Sun, 03 Apr 2016 13:09:49 GMT</pubDate>
    <dc:date>2016-04-03T13:09:49Z</dc:date>
    <dc:language>en</dc:language>
    <dc:rights>SvD 2016</dc:rights>
    <image>
    <title>svd.se</title>
    <url>http://www.svd.se/template/images/rss/svd_88x26.gif</url>
    <link>http://www.svd.se/</link>
    <description>Svenska Dagbladet</description>
    </image>
    <item>
    <title>”Rasismen smyger sig in i våra blodomlopp”</title>
    <link>http://www.svd.se/rasismen-smyger-sig-in-i-vara-blodomlopp</link>
    <description>&lt;p&gt;Alexandra Pascalidou har levt med hot och rasism under större delen av sitt liv. I SVT-serien ”Vi kallas tiggare” pratar hon med romer om rykten, hat och utanförskap.&lt;/p&gt;</description>
    <category>Kultur</category>
    <pubDate>Sun, 03 Apr 2016 09:45:00 GMT</pubDate>
    <guid isPermaLink="false">http://www.svd.se/rasismen-smyger-sig-in-i-vara-blodomlopp</guid>
    <dc:date>2016-04-03T09:45:00Z</dc:date>
    <geo:lat>40.2031</geo:lat>
    <geo:long>28.96331</geo:long>
    </item>
    <item>
    <title>Barcelona bär arvet efter Cruyff</title>
    <link>http://www.svd.se/barcelona-bar-arvet-efter-cruyff</link>
    <description />
    <category>Kultur</category>
    <pubDate>Sun, 03 Apr 2016 13:00:00 GMT</pubDate>
    <guid isPermaLink="false">http://www.svd.se/barcelona-bar-arvet-efter-cruyff</guid>
    <dc:date>2016-04-03T13:00:00Z</dc:date>
    <geo:lat>41.3887868890716</geo:lat>
    <geo:long>2.15898513793945</geo:long>
    </item>
    <item>
    <title>Flera till sjukhus efter knivdrama</title>
    <link>http://www.svd.se/tva-knivskadade-i-husby</link>
    <description>&lt;p&gt;Flera personer har knivskadats i Husby i nordvästra Stockholm.&lt;/p&gt;</description>
    <category>Sverige</category>
    <pubDate>Sun, 03 Apr 2016 11:09:34 GMT</pubDate>
    <guid isPermaLink="false">http://www.svd.se/tva-knivskadade-i-husby</guid>
    <dc:date>2016-04-03T11:09:34Z</dc:date>
    <geo:lat>59.4081</geo:lat>
    <geo:long>17.92846</geo:long>
    </item>
    </channel>
    </rss>
    """
  end

end
