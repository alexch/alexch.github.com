here = File.expand_path(File.dirname(__FILE__))
up = File.expand_path("#{here}/..")
require "#{up}/lib/bookmarklet"

class Index < Page
  def page_title
    'Alex\'s Bookmarklets - New Twitter RSS Bookmarklet, Font Bookmarklet'
  end
  
  external :style, <<-CSS
  div.creation {
      padding: .25em;
      float:left;
  }
  div.creation a {  border: 2px solid #a3a3a3; -webkit-border-top-left-radius: 2px 2px; -moz-border-radius-topleft: 2px; -webkit-border-top-right-radius: 2px 2px; -moz-border-radius-topright: 2px; -webkit-border-bottom-left-radius: 2px 2px; -moz-border-radius-bottomleft: 2px; -webkit-border-bottom-right-radius: 2px 2px; -moz-border-radius-bottomright: 2px; margin: 0px; padding: 1px; }
  div.creation a:hover { border-color: red;}
  
  blockquote.bookmarklet a {
    border: 1px solid gray;
    background: #DDD;
    padding: .25em;
    text-decoration: none;
    font-weight: bold;
  }
  
  div.fb-like {
    float: right;
  }
  
  CSS

  def icon_dir
    "../icons"
  end

  def main
    br
    facebook_like "http://alexchaffee.com/bookmarklets"
    section "" do
      item do
        h1 'Alex\'s Bookmarklets'
      end
      p do
        text "Hey, do these work? If not, "
        a "let me know", :href => "mailto:alex@stinky.com"
        text ", OK?"
      end
    end
    
    section "Fonzie" do
      h2 "Answering the eternal quesion, \"What font is that?\""
      p do
        b 'Install: '
        text 'Drag the link below to your bookmarks bar.'
      end
      blockquote.bookmarklet do
        here = File.expand_path(File.dirname(__FILE__))        
        b = Bookmarklet.new File.read("#{here}/fonzie.js")
        a "Fonzie", :href => "javascript:#{b.squished}"  # no idea why it shouldn't be escaped now
        # a "Fonzie", :href => b.href
      end
      p do
        b 'Usage: '
        text 'Select some text on the page. Click the "Fonzie" bookmark link. See the font.'
      end
      p do
        b 'Source: '
        a :href => 'http://github.com/alexch/fonzie' do
          text 'hosted on GitHub'
        end
      end
      p do
        b 'Update: '
        text 'Fonzie gets a bit cooler, now skipping common values like "0px" and "none".'
      end
    end
    
    section "Better Twitter Trends" do
      h2 'I think @Twitter should change "trends" to "insipid bullshit that 12 year-olds and SEO spammers are talking about."'
      blockquote { a " - wilw", href: "https://twitter.com/#!/wilw/status/130722431911460864"}
      p do
        p do
          b 'Install: '
          text 'Drag the link below to your bookmarks bar.'
        end
        blockquote.bookmarklet do
          here = File.expand_path(File.dirname(__FILE__))                
          b = Bookmarklet.new File.read("#{here}/better_trends.js")
          a 'Better Trends', :href => b.href
        end
        p do
          b 'Usage: '
          text 'Click it when you get tired of the insipid bullshit in your Trends sidebar.'
          p "Better trend suggestions welcome!"
        end
      end
      img src: "better-trends.png"      
    end

    section "Twitter RSS" do
      h2 'New Twitter RSS Bookmarklet'
      p do
        text 'The New Twitter UI doesn\'t show an RSS feed for the user you\'re looking at anymore. Instead, it only shows you an RSS feed for your own tweets, which seems sort of vainglorious to me.'
      end
      p do
        text 'Here\'s a bookmarklet, written by '
        a :href => 'http://twitter.com/jacobrothstein' do
          text '@jacobrothstein'
        end
        text ' and converted by '
        a :href => 'http://twitter.com/alexch' do
          text '@alexch'
        end
        text ' using Gruber\'s '
        a :href => 'http://daringfireball.net/2007/03/javascript_bookmarklet_builder' do
          text 'Bookmarklet Builder'
        end
        text ' script.'
      end
      js = <<-JAVASCRIPT
$('.profile-details').
  append('<a href="/statuses/user_timeline/' + 
    $('span.screen-name').text().replace('@','') + 
    '.rss">RSS</a>')
      JAVASCRIPT
      p do
        text 'Drag this little dude to your bookmarks bar and click it when you\'re on someone\'s timeline. It\'ll put an "RSS" link right under the user\'s bio, for you to click or copy.'
        blockquote.bookmarklet do          
          a 'Twitter RSS', :href => (Bookmarklet.new js).href
        end
      end
      
      p do
        b 'Source: '
        pre js
      end
      p do
        b 'Update:'
        text ' fixed to work in Firefox (thanks to Adam Curry for bug report)'
      end
      p do
        b 'Update (2011-06-23):'
        text ' now uses twitter screen name, not user id, in RSS URL'
      end
    end

    section 'Fix Cloudant Heroku Console' do
      p do
        text "Cloudant's Heroku console ("
        url("http://cloudant/futon/database.html")
        text ") wraps the normal futon in some extra HTML, showing the heroku header and a Cloudant 'overview'. Unfortunately this pushes down the main futon content so that even when you're scrolled down all the way, on long pages, you can't see the futon controls ('showing 1-82 of 82 rows' and the 'rows per page' and 'next page' widgets). This trivial bookmarklet fixes it by giving the 'wrap' div a height of 88% instead of 100%."
      end
      blockquote.bookmarklet do          
        here = File.expand_path(File.dirname(__FILE__))                
        b = Bookmarklet.new File.read("#{here}/cloudant_fix.js")
        a 'Cloudant Fix', :href => b.href
      end      
    end


    section "Credits" do
      hr
      p do
        text 'All bookmarklets on this page were written (or improved) by '
        a :href => 'http://alexch.github.com' do
          text 'Alex Chaffee'
        end
        text ' and are in the public domain. If you like them, drop me a line.'
      end
      p do
        text 'Built using'
        a :href => 'http://daringfireball.net/2007/03/javascript_bookmarklet_builder' do
          text 'Bookmarklet Builder'
        end
        text 'by John Gruber.'
      end
    end
    
  end
end

if __FILE__ == $0
  system "erector --to-html #{__FILE__}"
end
