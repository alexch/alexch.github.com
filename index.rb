require 'rubygems'
require 'erector'
require './rounded'
require './iconistan'

# http://fontdeck.com/project/1443

class Index < Erector::Widgets::Page
  extend Rounded
  external :style, <<-STYLE
/* layout */
#alex_pic {float: right; clear: right;}

div.iconistan { float: right;}
div.prefix { float: right; padding-top: 5px;}

#right_side {
  float: right;
  font-size: 10pt;
  width: 30%;
  background: white;
}

.clear { clear: both; }


#top { 
  background: #EAD1FF;
  border-bottom: 1px solid #A04DFF; 
    font-size: 11pt;
    padding: .15em .25em .1em;
    min-height: 26px;    
}
#top .email { margin-left: 2em;}
#top .logo {
  padding-top: 1em;
  padding-left: 1em;
}
#top .logo b {
  font-size: 32pt;
}

/* styling */
  
body { 
  font-family: 'Optima', 'Trebuchet MS', Gill Sans, Tahoma, Geneva, sans-serif;	
  margin: 0px;
}

#sections ul { list-style-position: inside; }

h1 { margin: 0; }
h2 {margin-bottom: .5em;}

h1,h2,h3,#top b { 
  font-family:"Eigerdals Black", 'Trebuchet MS', sans-serif; font-weight:800; font-style:normal;
}


#sections {
  margin-left: 2em;
}

.section {
  margin: 2em 1em;
}

.section 
  h2.title {
    float: left;
    width: 8em;
    
    -webkit-margin-before: 0;
    -webkit-margin-after: 0.83em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
    
  }

.section
  .items {
    padding-left: 12em;
  }

ul {margin-top: .5em;}
img { border-style: none; }

.footer { border-top: 1px solid black; background: #e8e8e8; font-size: 10pt; text-align: center; padding: .5em; }

 .items>ul {
  -webkit-margin-before: 0;
  -webkit-margin-after: 0;
  -webkit-margin-start: 0;
  -webkit-margin-end: 0;
  -webkit-padding-start: 0;  
  list-style-type: none;
}

li.item {
  margin-bottom: .25em;
}

li.item
  span.name {
    font-weight: bold;
  }
li.item
  span.name a {
    text-decoration: none;
  }

.twitter, .reader, .tumblr {
  float: left;
  border: 2px solid #a3a3a3; margin: 1em; #{rounded}
}

.tumblr > ol {
  max-height: 500px;
  overflow-y: auto;
}

.flickr {
  float: left;
  border: 2px solid #a3a3a3; margin: 1em 1em 0em; #{rounded}
}

h3 {
  background-color: #e8e8e8; 
  border-bottom: 1px solid #9d9d9d;
  margin: 0px; padding: .25em 1em;
  #{rounded(:top)}
}
.tweet {font-size: 10pt;}
h3 a { text-decoration: none; }

a { color: #0000dd; }
a:hover { color: red; }
a:visited { color: #4E3EFF; }

.tumblr {
  padding: 0; margin: 1em;
  border: 2px solid gray;
  #{rounded}
}
.tumblr_posts {
  list-style-type: none;
  list-style-position: outside;
  background: #f5f5f5;
  margin: 0; padding: 1em;
  #{rounded}
}
.tumblr_post {
  display: block;
  list-style-type: none;
  list-style-position: outside;
  background: #ffffff;
  border: 4px solid #c0c0c0;
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

  external :js, "http://ajax.googleapis.com/ajax/libs/jquery/1.3.1/jquery.min.js"
  external :js, "tweet/jquery.tweet.js"
  external :css, "tweet/jquery.tweet.css"
  
  external :script, <<-SCRIPT
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
  
  def head_content
    super
    link :rel=>"stylesheet", :href=>"http://f.fontdeck.com/s/css/u5mYSdgdXljzmDHdstX1xDoEPik/alexch.github.com/1443.css", :type=>"text/css"
  end
  
  def self.google_analytics_code account_id
    <<-JAVASCRIPT
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', '#{account_id}']);
    _gaq.push(['_setDomainName', 'none']);
    _gaq.push(['_setAllowLinker', true]);
    _gaq.push(['_trackPageview']);

    (function() {
      var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
      ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
      var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
    JAVASCRIPT
  end

  external :script, google_analytics_code('UA-23417120-1')
  
  def body_content

    div :id => "top" do
      iconistan
      div.logo {
        b "Alex Chaffee"
        a "alex@stinky.com", :class => "email", :href => "mailto:alex@stinky.com"
      }
      
    end

    div :id => "alex_pic" do
      alex_pic
    end

    div.sections! do
      section "Teaching" do
        item "Test-First Teaching", "http://testfirst.org", "learn by doing"
        item "Ruby Notes", "http://github.com/alexch/ruby_notes"
        item "JavaScript Notes", "http://github.com/alexch/javascript_notes"
        item "RailsBridge", "http://railsbridge.org", "the more coders the better"
      end

      section "Apps" do
        item "Moodlog", "http://moodlog.org", "how do you feel?"
        item "Cohuman", "http://cohuman.com", "what are you doing?"
        item "Bookmarklets", "bookmarklets/index.html" do
          ul do
            item "New Twitter RSS Link", "http://alexch.github.com/bookmarklets/#twitterrss", 
              "creates a link to the RSS feed for the Twitter user you're looking at"
            item "Fonzie", "http://alexch.github.com/bookmarklets/#fonzie", "tells you what font the selected text is in"
          end
        end
      end
      
      section "Sites" do
        item "JesusPAC", "http://JesusPAC.com/", "kicking ass for the Lord"
        item "Are Bill And Emily Watching Fringe Yet?", "http://arebillandemilywatchingfringeyet.com/", "single-serving site (reload for full effect)"
        item "Stinky Art Collective", "http://stinky.com"
      end

      section "Code" do
        item "Wrong", "http://github.com/alexch/wrong", "the right way to assert"
        item "Erector", "http://erector.rubyforge.org", "views in pure Ruby, no angle brackets required"
        item "Whos", "http://github.com/alexch/whos", "command-line parallelized whois, minus the spam"
        item "Rerun", "https://github.com/alexch/rerun", "relaunch your thingy after stuff changes"
        item "Purple Technology", "http://purpletech.com", "Java lore"
        item "Fork me on GitHub", "http://github.com/alexch"
      end

      # section "Interests" do
      #   item "Dolores Park", "http://"
      #   item "Quantified Self", "http://"
      # end

      section "Writings" do
        item "Alexisms", "http://pivotallabs.com/users/alex/blog/articles/349-alexisms", "aphorismic emanations"
        item do
          text "Courting Demeter, on three blogs: "
          a "Purple", :href => "http://www.purpletech.com/blog/index.php?itemid=25"
          text ", "
          a "Pivotal", :href => "http://pivots.pivotallabs.com/users/alex/blog/articles/273-lovely-demeter-meter-maid"
          text " and "
          a "haacked", :href => "http://haacked.com/archive/2009/07/14/law-of-demeter-dot-counting.aspx#72846"
          text "."
        end
        item "Loose Lips", "http://pivotallabs.com/users/alex/blog", "my Pivotal blog"
        item "alexch's almanac", "http://alexch.tumblr.com/", "my Tumblog: mostly pull quotes, occasional rants"
      end
      
      career
      
      div.clear

      section "Feeds" do
        flickr      
        table do
          tr do
            td(:valign => :top, :width => "50%") { twitter }
            td(:valign => :top, :width => "50%") { reader }
          end
        end
        tumblr
      end
    end
    
    div.clear
    footer

  end
  

  def reader_widget
    div :class => "reader_widget" do
      javascript :src => "http://www.google.com/reader/ui/publisher-en.js"
      javascript :src =>  "http://www.google.com/reader/public/javascript/user/15504357426492542506/state/com.google/broadcast?n=8&callback=GRC_p(%7Bc%3A%22khaki%22%2Ct%3A%22Alex%20Chaffee%5C's%20shared%20items%22%2Cs%3A%22true%22%2Cb%3A%22false%22%7D)%3Bnew%20GRC"
    end
  end
  
  def flickr
    div :class => "flickr" do
      h3 { a "Flickr", :href=> "http://www.flickr.com/photos/alexchaffee/" }
      center { flickr_widget }
    end
  end
  
  def twitter
    div :class => "twitter" do
      h3 { a "Twitter", :href=> "http://twitter.com/alexch" }
      div :class => "tweet"
    end
  end    
  
  def reader
    div :class => "reader" do
      h3 { a "Google Reader", :href => "http://google.com/reader/shared/alexch" }
      center do
        div :class => "reader_widget" do
          reader_widget
        end
      end
    end 
  end
 
  def footer
    div :class => "footer" do
      text "This site produced with "
      a "Erector", :href => "http://erector.rubyforge.org"
      text ". Source code at "
      a "Github", :href => "http://github.com/alexch/alexch.github.com"
      text "."
    end
  end
  
  def tumblr
    div :class => "tumblr" do
      h3 { a "Tumblr", :href => "http://alexch.tumblr.com/" }
      javascript :src=>"http://alexch.tumblr.com/js"
    end
  end
  
  def iconistan
    widget Iconistan, :sites =>
    [
      "http://twitter.com/alexch",
      "http://google.com/profiles/alexch",
      "http://tumblr.com/alexch",
      "http://github.com/alexch",
      "http://friendfeed.com/alexch",
      "http://linkedin.com/in/alexchaffee",  
      "http://facebook.com/daycha",
      "http://flickr.com/photos/alexchaffee/",
      "http://pivotallabs.com/users/alex/blog",
      "http://google.com/reader/shared/alexch",
      "http://stinky.com/alex",
      "http://foursquare.com/alexch"
    ]
    div "More Alex:", :class => "prefix"
  end
  
  def section name
    div.section do
      h2.title name
      div.items do
        ul do
          yield
        end
      end
    end
  end
  
  def item name = nil, url = nil, description = nil
    li.item do
      if name
        span.name {
          if url
            a name, :href => url
          else
            text name
          end
        }
        text " - " if description          
      end
    
      text description if description
  
      yield if block_given?
    end
  end
  
  def career
    section "Career" do
      item do
        text "Teacher and courseware author at ",
          a("Blazing Cloud", :href=> "http://blazingcloud.net"),
          " and ",
          a("Marakana", :href=> "http://marakana.com"),
          " (2010 - present)"
      end
            
      item do
        text "CTO and Co-founder at "
        a "Cohuman", :href => "http://cohuman.com"
        text " (2009-2010)"
      end

      item do
        text "Architect and Lead Developer on "
        a "Pivotal Tracker", :href => "http://www.pivotaltracker.com"
        text " (2006-2008)"
      end
    
      item do
        text "Principal, Senior Coach, Director of Systems, and Mad Scientist at "
        a "Pivotal Labs", :href => "http://www.pivotallabs.com"
        text " (2004-2008)"
      end
    
      item do
        text "Teacher/Coder/Mentor at "
        a "jGuru", :href => "http://www.jguru.com"
        text " (1999-2001)"
      end
    
      item do
        text "Founder and Principal Consultant at "
        a "Purple Technology", :href => "http://www.purpletech.com"
        text " (1998-2004)"
      end
    
      item do
        text "Creator and Dalang of "
        a "Gamelan", :href => "http://web.archive.org/web/19961220054020/http://www.gamelan.com/"
        text " (1995-1998)"
      end
    
      item do
        text "Director of Engineering at "
        a "EarthWeb", :href => "http://web.archive.org/web/19961103131307/http://www.earthweb.com/"
        text " (1995-1998)"
      end
    
      item do
        text "Student of Cognitive Psychology at "
        a "Reed College", :href => "http://reed.edu"
        text " (1989-1992)"
      end
      
      item do
        text "Obligatory ", a("LinkedIn", :href=>"http://linkedin.com/in/alexchaffee"), " hyperlink"
      end
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
  
  def flickr_widget
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
    <script type="text/javascript" src="http://www.flickr.com/badge_code_v2.gne?show_name=1&count=4&display=random&size=t&layout=v&source=user&user=88815727%40N00"></script>
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
