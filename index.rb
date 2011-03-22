require 'rubygems'
require 'erector'
require './rounded'
require './iconistan'

# http://fontdeck.com/project/1443

class Index < Erector::Widgets::Page
  extend Rounded
  external :style, <<-STYLE
/* layout */
#alex_pic {float: left;}

#right_side {
  float: right;
  font-size: 10pt;
  width: 30%;
  background: white;
}

#feeds { clear: both; }

#headline { padding: 2em .25em; float: left; }
#headline .email { padding-left: 2px;}

/* styling */
  
body { 
  font-family: 'Optima', 'Trebuchet MS', Gill Sans, Tahoma, Geneva, sans-serif;	
  margin: 0px;
}

#bullets { margin-left: 1em; clear: left;}

h1 { margin: 0; }
h2 {margin-bottom: .5em;}

h1,h2,h3 { 
  font-family:"Eigerdals Black", 'Trebuchet MS', sans-serif; font-size-adjust:0.532; font-weight:800; font-style:normal;
}

ul {margin-top: .5em;}

.footer { border-top: 1px solid black; background: #e8e8e8; font-size: 10pt; text-align: center; padding: .5em; }

.twitter, .reader, .tumblr {
  float: left;
  border: 2px solid #a3a3a3; margin: 1em; #{rounded}
}

.flickr {
  float: right;
  border: 2px solid #a3a3a3; margin: 0 1em; #{rounded}
}

h3 {
  background-color: #e8e8e8; border-bottom: 1px solid #9d9d9d;
  margin: 0px; padding: .25em 1em;
  #{rounded(:top)}
}
.tweet {font-size: 10pt;}
h3 a { text-decoration: none; }
a:hover { color: red; }

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
 
  def body_content
    # div :id => "right_side" do
    #   twitter
    #   flickr
    #   reader
    # end
    
    div :id => "alex_pic" do
      alex_pic
    end

    div :id => "headline" do
      h1 "Alex Chaffee"
      a "alex@stinky.com", :class => "email", :href => "mailto:alex@stinky.com"
      iconistan
    end

    div :id => :bullets do
      flickr      
      projects
      past
      prose
      professional
    end

    div :id => :feeds do
      table do
        tr do
          td(:valign => :top, :width => "50%") { twitter }
          td(:valign => :top, :width => "50%") { reader }
        end
        tr do
          td(:valign => :top, :colspan => 2) { tumblr }
        end
      end
    end
    
    footer

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
      "http://google.com/profiles/alexch",
      "http://twitter.com/alexch",
      "http://tumblr.com/alexch",
      "http://github.com/alexch",
      "http://friendfeed.com/alexch",
      "http://linkedin.com/in/alexchaffee",  
      "http://facebook.com/daycha",
      "http://flickr.com/photos/alexchaffee/",
      "http://pivotallabs.com/users/alex/blog",
      "http://google.com/reader/shared/alexch",
      "http://stinky.com/alex",
    ]
  end
  
  def past
    div :class => "past" do
      h2 "Past"
      ul do
        li do
          text "CTO and Co-founder at "
          a "Cohuman", :href => "http://cohuman.com"
          text " (2009-2010)"
        end

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
    end
  end
  
  def projects
    div :class => "projects" do
    h2 "Projects"
    ul do
      [
        ["New Twitter RSS Bookmarklet", "http://alexch.github.com/twitter-rss-bookmarklet.html", "RSS feed link for the user you're looking at"],
        ["Moodlog", "http://moodlog.org", "how do you feel?"],
        ["Wrong", "http://github.com/alexch/wrong", "the right way to assert"],
        ["Erector", "http://erector.rubyforge.org", "views in pure Ruby, no angle brackets required"],
        ["Vegas", "http://github.com/alexch/vegas", "the un-framework"],
        ["Stinky Art Collective", "http://stinky.com"],
        ["Purple Technology", "http://purpletech.com", "Java lore"],
        ["Alexisms", "http://pivotallabs.com/users/alex/blog/articles/349-alexisms", "aphorismic emanations"],
        ["Deep Test", "http://github.com/qxjit/deep-test", "we put the *use* in 'CPUs'"],
        ["Test-First Teaching", "http://testfirst.org", "learn by doing"],
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
    end
  end
  
  def prose
    div :class => "prose" do
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
    end
  end
  
  def professional
    # h2 "Professional"
    # ul do
    #   
    # end
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
