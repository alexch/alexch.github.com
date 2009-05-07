require 'rubygems'
require 'erector'

class Index < Erector::Widget

  def content

    h1 "Alex Chaffee"

    h2 "Personality"
    ul do
      [
        "http://www.google.com/profiles/alexch",
        "http://www.twitter.com/alexch",
        "http://www.tumblr.com/alexch",
        "http://github.com/alexch",
        "http://pivotallabs.com/users/alex/blog",
        "http://friendfeed.com/alexch",
        "http://www.new.facebook.com/profile.php?id=668119049",
        "http://www.google.com/reader/shared/15504357426492542506",
        "http://www.flickr.com/photos/alexchaffee/"
      ].each do |u|
        li do
          url u
        end
      end
    end
    
    h2 "Projects"
    ul do
      [
        ["Moodlog", "http://moodlog.org"],
        ["Erector", "http://erector.rubyforge.org"],
      ].each do |site|
        li do
          a site[0], :href => site[1]
        end
      end
      
    end

    # h2 "Professional"
    # ul do
    #   
    # end
  end
end

if __FILE__ == $0
  system "erector --to-html #{__FILE__}"
end
