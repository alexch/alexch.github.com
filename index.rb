require 'rubygems'
require 'erector'


class Index < Erector::Widget

  def content

    h1 "Alex Chaffee"

    h2 "Personality"
    ul do
      
      li do
        url "http://www.google.com/profiles/alexch"
      end
      li do
        url "http://www.twitter.com/alexch"
      end
      li do
        url "http://www.tumblr.com/alexch"
      end
      li do
        url "http://github.com/alexch"
      end
      li do
        url "http://pivotallabs.com/users/alex/blog"
      end
      li do
        url "http://friendfeed.com/alexch"
      end
      li do
        url "http://www.new.facebook.com/profile.php?id=668119049"
      end
      li do
        url "http://www.google.com/reader/shared/15504357426492542506"
      end
      li do
        url "http://www.flickr.com/photos/alexchaffee/"
      end
    end
    
    h2 "Projects"
    ul do
      
    end

    h2 "Pals"
    ul do
      
    end

    h2 "Professional"
    ul do
      
    end
  end
end

