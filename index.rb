require 'rubygems'
require 'erector'
require 'page'

class Index < Page
  
  style <<-STYLE
    body {
      font-family: Gill Sans, Tahoma, Geneva, sans-serif;	
      margin: 0px;
    }

    ul.personality {
      list-style-type: none;
    }
    ul.personality img {
      margin: .25em;
      vertical-align: text-bottom;
    }
    
    .alex-badge {
      float: left;
    }
    
    .right-side {
      float: right;
      font-size: 10pt;
      width: 30%;
      border-left: 4px solid gray;
      border-bottom: 4px solid gray;
      background: white;
    }
    h3 {
      background-color: gray;
      margin: 0px;
      padding-top: 1em;
      padding-left: 1em;
      padding-bottom: .25em;
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
    
    .tumblr_posts {
      list-style-type: none;
      list-style-position: outside;
    }
    
    .tumblr_post {
      display: block;
      list-style-type: none;
      list-style-position: outside;
      border: 8px solid #c0c0c0;
      background: #f5f5f5;
      font-size: 10pt;
      padding: 1em;
      margin: 0em;
      margin-bottom: 1em;
      
    }
    .tumblr_photo_post img {
      margin: auto;
    }
    .tumblr_source {
      font-style: italic;
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
          auto_join_text_ing: "I was",
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
      h3 "Flickr"
      center { flickr }
      
      h3 "Twitter"
      center { div :class => "tweet" }

      h3 "Google Reader"
      center do
        div :class => "reader" do
          reader
        end
      end
      
    end
    
    div :class => "alex-badge" do
      alex_pic
    end

    br
    h1 "Alex Chaffee"
    a "alex@stinky.com", :href => "mailto:alex@stinky.com"

    br :style => 'clear: left'

    h2 "Personality"
    ul :class => "personality" do
      [
        "http://google.com/profiles/alexch",
        "http://twitter.com/alexch",
        "http://tumblr.com/alexch",
        "http://github.com/alexch",
        "http://pivotallabs.com/users/alex/blog",
        "http://friendfeed.com/alexch",
        "http://facebook.com/daycha",
        "http://google.com/reader/shared/alexch",
        "http://flickr.com/photos/alexchaffee/",
        "http://stinky.com/alex",
      ].each do |u|
        domain = u.match(/http:\/\/([^.]*)\./)[1]
        li do
          img :src => "icons/#{domain}.png", :height => 16, :width => 16
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
        ["Mission: Implausible", "http://wiki.github.com/alexch/mission", "calling all ruby noobies!"],
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
    
    h2 "Prose"
    ul do
      li do
        text "Courting Demeter, on three blogs: "
        a "Purple", :href => "http://www.purpletech.com/blog/index.php?itemid=25"
        text ", "
        a "Pivotal", :href => "http://pivots.pivotallabs.com/users/alex/blog/articles/273-lovely-demeter-meter-maid"
        text " and "
        a "haacked", :href => "http://haacked.com/archive/2009/07/14/law-of-demeter-dot-counting.aspx#72846"
        text "."
      end
    end

    # h2 "Professional"
    # ul do
    #   
    # end

    div :class => "tumblr" do
      a :href => "http://alexch.tumblr.com/" do
        h3 "Tumblr"
      end
      javascript :src=>"http://alexch.tumblr.com/js"
    end

  end
  
  def alex_pic
    rawtext <<-HTML
    <!-- Start of Flickr Badge -->
    <style type="text/css">
    #flickr_badge_source_txt {padding:0; font: 11px Arial, Helvetica, Sans serif; color:#666666;}
    #flickr_badge_icon {display:block !important; margin:0 !important; border: 1px solid rgb(0, 0, 0) !important;}
    #flickr_icon_td {padding:0 5px 0 0 !important;}
    .flickr_badge_image {text-align:center !important;}
    .flickr_badge_image img {border: 1px solid black !important;}
    #flickr_www {display:block; padding:0 10px 0 10px !important; font: 11px Arial, Helvetica, Sans serif !important; color:#3993ff !important;}
    #flickr_badge_uber_wrapper a:hover,
    #flickr_badge_uber_wrapper a:link,
    #flickr_badge_uber_wrapper a:active,
    #flickr_badge_uber_wrapper a:visited {text-decoration:none !important; background:inherit !important;color:#3993ff;}
    #flickr_badge_wrapper {background-color:#ffffff;border: solid 1px #000000}
    #flickr_badge_source {padding:0 !important; font: 11px Arial, Helvetica, Sans serif !important; color:#666666 !important;}
    </style>
    <table id="flickr_badge_uber_wrapper" cellpadding="0" cellspacing="10" border="0"><tr><td>
      
<!--      <a href="http://www.flickr.com" id="flickr_www">www.<strong style="color:#3993ff">flick<span style="color:#ff1c92">r</span></strong>.com</a>
    -->
      
      <table cellpadding="0" cellspacing="10" border="0" id="flickr_badge_wrapper">
    <script type="text/javascript" src="http://www.flickr.com/badge_code_v2.gne?count=1&display=random&size=m&layout=v&source=user_tag&user=88815727%40N00&tag=alex"></script>
    </table>
    </td></tr></table>
    <!-- End of Flickr Badge -->
    HTML
  end
  
  def flickr
    rawtext <<-HTML
    <!-- Start of Flickr Badge -->
    <style type="text/css">
    #flickr_badge_source_txt {padding:0; font: 11px Arial, Helvetica, Sans serif; color:#666666;}
    #flickr_badge_icon {display:block !important; margin:0 !important; border: 1px solid rgb(0, 0, 0) !important;}
    #flickr_icon_td {padding:0 5px 0 0 !important;}
    .flickr_badge_image {text-align:center !important;}
    .flickr_badge_image img {border: 1px solid black !important;}
    #flickr_badge_uber_wrapper {width:150px;}
    #flickr_www {display:block; text-align:center; padding:0 10px 0 10px !important; font: 11px Arial, Helvetica, Sans serif !important; color:#3993ff !important;}
    #flickr_badge_uber_wrapper a:hover,
    #flickr_badge_uber_wrapper a:link,
    #flickr_badge_uber_wrapper a:active,
    #flickr_badge_uber_wrapper a:visited {text-decoration:none !important; background:inherit !important;color:#3993ff;}
    #flickr_badge_wrapper {background-color:#CCCCFF;border: solid 1px #000000}
    #flickr_badge_source {padding:0 !important; font: 11px Arial, Helvetica, Sans serif !important; color:#666666 !important;}
    </style>
    <table id="flickr_badge_uber_wrapper" cellpadding="0" cellspacing="10" border="0"><tr><td><a href="http://www.flickr.com" id="flickr_www">www.<strong style="color:#3993ff">flick<span style="color:#ff1c92">r</span></strong>.com</a><table cellpadding="0" cellspacing="10" border="0" id="flickr_badge_wrapper">
    <script type="text/javascript" src="http://www.flickr.com/badge_code_v2.gne?show_name=1&count=3&display=random&size=t&layout=v&source=user&user=88815727%40N00"></script>
    <tr>
    <td id="flickr_badge_source" valign="center" align="center">
    <table cellpadding="0" cellspacing="0" border="0"><tr>
    <td width="10" id="flickr_icon_td"><a href="http://www.flickr.com/photos/alexchaffee/"><img id="flickr_badge_icon" alt="purplepix's items" src="http://farm1.static.flickr.com/42/buddyicons/88815727@N00.jpg?1137351419#88815727@N00" align="left" width="48" height="48"></a></td>
    <td id="flickr_badge_source_txt"><nobr>Go to</nobr> <a href="http://www.flickr.com/photos/alexchaffee/">purplepix's photostream</a></td>
    </tr></table>
    </td>
    </tr>
    </table>
    </td></tr></table>
    <!-- End of Flickr Badge -->
    HTML
  end
end

if __FILE__ == $0
  system "erector --to-html #{__FILE__}"
end
