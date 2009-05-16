require 'rubygems'
require 'erector'
require 'page'

class Index < Page
  
  style <<-STYLE
    body {
      font-family: Tahoma, Geneva, sans-serif;	
    }
    
    .tweet {
      float: right;
      font-size: 10pt;
      width: 20%;
    }
  STYLE

  js "http://ajax.googleapis.com/ajax/libs/jquery/1.3.1/jquery.min.js"
  js "tweet/jquery.tweet.js"
  css "tweet/jquery.tweet.css"
  
  script <<-SCRIPT
  $(document).ready(function(){
      $(".tweet").tweet({
          username: "alexch",
          join_text: "auto",
          avatar_size: 32,
          count: 3,
          auto_join_text_default: "I said,",
          auto_join_text_ed: "I",
          auto_join_text_ing: "I were",
          auto_join_text_reply: "I replied to",
          auto_join_text_url: "I was checking out",
          loading_text: "loading tweets..."
      });
  });
  SCRIPT
  

  def body_content

    div :class => "tweet"

    h1 "Alex Chaffee"
    a "alex@stinky.com", :href => "mailto:alex@stinky.com"

    h2 "Personality"
    ul do
      [
        "http://google.com/profiles/alexch",
        "http://twitter.com/alexch",
        "http://tumblr.com/alexch",
        "http://github.com/alexch",
        "http://pivotallabs.com/users/alex/blog",
        "http://friendfeed.com/alexch",
        "http://facebook.com/people/Alex-Chaffee/668119049",
        "http://google.com/reader/shared/15504357426492542506",
        "http://flickr.com/photos/alexchaffee/",
        "http://stinky.com/alex",
      ].each do |u|
        domain = u.match(/http:\/\/([^.]*)\./)[1]
        li do
          img :src => "icons/#{domain}.png"
          text nbsp(" ")
          url u
        end
      end
    end
    
    h2 "Projects"
    ul do
      [
        ["Moodlog", "http://moodlog.org"],
        ["Erector", "http://erector.rubyforge.org"],
        ["Stinky Art Collective", "http://stinky.com"],
        ["Purple Technology", "http://purpletech.com"],
        ["Alexisms", "http://pivotallabs.com/users/alex/blog/articles/349-alexisms"],
        ["Deep Test", "http://github.com/qxjit/deep-test"],
      ].each do |site|
        li do
          a site[0], :href => site[1]
        end
      end      
    end
    
    h2 "Past"
    ul do
      li do
        text "Architect and Lead Developer on "
        a "Pivotal Tracker", :href => "http://www.pivotaltracker.com"
        text " (2006-2008)"
      end
      
      li do
        text "Principal, Senior Coach, Director of Systems, and Mad Scientist at "
        a "Pivotal Labs", :href => "http://www.pivotallabs.com"
        text " (2004-2008)"
      end
      
      li do
        text "Teacher/Coder/Mentor at "
        a "jGuru", :href => "http://www.jguru.com"
        text " (1999-2001)"
      end
      
      li do
        text "Founder and Principal Consultant at "
        a "Purple Technology", :href => "http://www.purpletech.com"
        text " (1998-2004)"
      end
      
      li do
        text "Creator and Dalang of "
        a "Gamelan", :href => "http://web.archive.org/web/19961220054020/http://www.gamelan.com/"
        text " (1995-1998)"
      end
      
      li do
        text "Director of Engineering at "
        a "EarthWeb", :href => "http://web.archive.org/web/19961103131307/http://www.earthweb.com/"
        text " (1995-1998)"
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
