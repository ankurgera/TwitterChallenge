require 'tweets'

if(ARGV.size == 1 and !(ARGV[0] == " ") and !(ARGV[0].empty?))
  uniq_urls = Tweet.unique_urls(Tweet.fetch_urls(Tweet.recent_tweets(ARGV[0],100)))
  uniq_urls.each do |url| puts url end
else
  puts "Wrong Input!!!"
  puts ""
  puts "Usage Example => ruby find_links.rb anna"
end
