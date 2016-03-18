defmodule GeorssGenerator do

  def start(url) do
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(url)
    {:ok, feed, _} = FeederEx.parse(body)

    IO.puts feed.title
  end

end
