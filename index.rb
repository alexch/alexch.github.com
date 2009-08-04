require 'rubygems'
require 'erector'
require 'page'

class Index < Page
  
  style <<-STYLE
    body {
      font-family: Tahoma, Geneva, sans-serif;	
    }
    
    .right-side {
      float: right;
      font-size: 10pt;
      width: 30%;
    }
    .tweet {
      font-size: 10pt;
    }
    .reader {
    }
    .tumblr {
      padding: .5em;
      border: 2px solid gray;
      -webkit-border-bottom-left-radius: 5px 5px;
      -webkit-border-bottom-right-radius: 5px 5px;
      -webkit-border-top-left-radius: 5px 5px;
      -webkit-border-top-right-radius: 5px 5px;
      
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
          count: 6,
          auto_join_text_default: "I said,",
          auto_join_text_ed: "I",
          auto_join_text_ing: "I were",
          auto_join_text_reply: "I replied to",
          auto_join_text_url: "I was checking out",
          loading_text: "loading tweets..."
      });
  });
  SCRIPT

  def page_title
    "Alex Chaffee"
  end

  def reader
    div :class => "reader" do
      javascript :src => "http://www.google.com/reader/ui/publisher-en.js"
      javascript :src =>  "http://www.google.com/reader/public/javascript/user/15504357426492542506/state/com.google/broadcast?n=8&callback=GRC_p(%7Bc%3A%22khaki%22%2Ct%3A%22Alex%20Chaffee%5C's%20shared%20items%22%2Cs%3A%22true%22%2Cb%3A%22false%22%7D)%3Bnew%20GRC"
      
    end
  end
  
  def body_content

    div :class => "right-side" do
      h3 "Twitter"
      div :class => "tweet"

      div :class => "reader" do
        h3 "Google Reader"
        reader
      end
      
    end

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
        "http://facebook.com/daycha",
        "http://www.google.com/reader/shared/alexch",
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
        ["Moodlog", "http://moodlog.org", "how do you feel?"],
        ["Erector", "http://erector.rubyforge.org", "views in pure Ruby, no angle brackets required"],
        ["Vegas", "http://github.com/alexch/vegas", "the un-framework"],
        ["Stinky Art Collective", "http://stinky.com"],
        ["Purple Technology", "http://purpletech.com", "Java lore"],
        ["Alexisms", "http://pivotallabs.com/users/alex/blog/articles/349-alexisms", "aphorismic emanations"],
        ["Deep Test", "http://github.com/qxjit/deep-test", "we put the *use* in 'CPUs'"],
      ].each do |site|
        li do
          title, url, description = site
          a title, :href => url
          if description
            text " - "
            text description
          end
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
      
      li do
        text "Student of Cognitive Psychology at "
        a "Reed College", :href => "http://reed.edu"
        text " (1989-1992)"
      end
    end
      

    # h2 "Professional"
    # ul do
    #   
    # end

    div :class => "tumblr" do
      h3 "Tumblr"        
      javascript :src=>"http://alexch.tumblr.com/js"
    end

  end
  
end

if __FILE__ == $0
  system "erector --to-html #{__FILE__}"
end
