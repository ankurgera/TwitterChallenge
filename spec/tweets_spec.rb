require 'rubygems'
require 'ostruct'
require 'mocha'
require File.expand_path(File.dirname(__FILE__) + "/../src/tweets.rb")

describe Tweet do

 describe "Tweet.recent_tweets(hashtag,no_of_tweets)" do

  it "should fetch expected amount of tweets for a given hashtag" do
   search = mock(Twitter::Search)
   search.stub(:new).and_return(search=mock)
   search.stub(:hashtag).with("apple").and_return(hashtag=mock)
   hashtag.stub(:result_type).with("recent").and_return(recent=mock)
   recent.stub(:per_page).with(3).and_return(tweets=mock)
   record1 = OpenStruct.new
   record1.text = "Gli americani preferiscono l\342\200\231iPad ai #tablet Android http://t.co/lKLeaSz #news #apple"
   record2 = OpenStruct.new
   record2.text = "#iPad 3 de #Apple: comienza la producci\303\263n en Octubre http://ow.ly/694PD  #tecnologia"
   record3 = OpenStruct.new
   record3.text = "http://t.co/7KIHg6e #Cheap #and #Lowest #Price #Arcteryx #Firee #Softshell #Hooded #Jacket #Mens #Candy #Apple #Red #L"
   tweets.stub(:fetch).and_return([record1,record2,record3])
   result = Tweet.recent_tweets("apple",3)
   result.size.should == 3
  end
 end

 describe "Tweet.fetch_urls(tweets)" do

  it "should fetch urls from the tweets" do
   record = OpenStruct.new
   record.text = "Gli americani preferiscono l\342\200\231iPad ai #tablet Android http://t.co/lKLeaSz #news #apple"
   result = Tweet.fetch_urls([record])
   result[0].start_with?("http"||"https") == true
  end
 end

 describe "Tweet.unique_urls(urls)" do

  it "should fetch unique urls from a list of urls" do
    uniq_urls = Tweet.unique_urls(["http://j.mp/ow3tJG","http://j.mp/ow3tJG","http://t.co/rvhqyS1"])
    uniq_urls.should == ["http://j.mp/ow3tJG","http://t.co/rvhqyS1"]
  end
 end
 
end

