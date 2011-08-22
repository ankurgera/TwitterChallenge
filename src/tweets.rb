require 'rubygems'
require 'twitter'

class Tweet

  def self.recent_tweets(hashtag,no_of_tweets)
    search = Twitter::Search.new
    search.hashtag(hashtag).result_type("recent").per_page(no_of_tweets).fetch
  end

  def self.fetch_urls(tweets)
    urls = []
    tweets.each do |tweet|
     url=URI.extract(tweet.text)
     url.each do |u|
       urls << u if u.start_with?("http"||"https")
     end unless url.nil? || url.empty?
    end
   urls
  end

  def self.unique_urls(urls)
    urls.uniq
  end

end



