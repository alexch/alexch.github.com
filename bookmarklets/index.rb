here = File.expand_path(File.dirname(__FILE__))
up = File.expand_path("#{here}/..")
# require "#{up}/"

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
  
CSS

  def icon_dir
    "../icons"
  end

  def main
    br
    section "" do
      item do
        h1 'Alex\'s Bookmarklets'
      end
    end
    section "Fonzie" do
      h2 "Answering the eternal quesion, \"What font is that?\""
      p do
        b 'Install: '
        text 'Drag the link below to your bookmarks bar.'
      end
      blockquote.bookmarklet do
        a(:href => 'javascript:var%20msg%20=%20%22Fonzie%20says:%20\%22Ayy!%20%22;var%20sel%20=%20window.getSelection();var%20n%20=%20sel.anchorNode;if%20(n)%20{msg%20+=%20sel%20+%20%27%22\n%27;var%20s%20=%20getComputedStyle(n.parentNode);atts%20=%20[%22font-family%22,%22font-size%22,%22font-style%22,%22font-variant%22,%22font-weight%22,%22line-height%22,%22text-align%22,%22text-decoration%22,%22text-indent%22,%22text-rendering%22,%22text-shadow%22,%22text-overflow%22,%22text-transform%22,%22outline-color%22,%22outline-style%22,%22outline-width%22,%22color%22,%22background-color%22];var%20skip_values=[%22auto%22,%27normal%27,%27none%27,%270px%27,%27rgb(0,%200,%200)%27,%27rgba(0,%200,%200,%200)%27,%27rgb(255,%20255,%20255)%27];for%20(var%20i=0;i<atts.length;++i)%20{var%20a=atts[i];v%20=%20s.getPropertyValue(a);var%20skip%20=%20false;for%20(var%20j=0;j<skip_values.length;++j)%20{if%20(v%20==%20skip_values[j])%20{skip%20=%20true;}}if%20(!skip%20&&%20!(a==%22text-align%22%20&&%20v==%22left%22))%20{msg%20+=%20a%20+%20%22:%20%22%20+%20v%20+%20%22\n%22;}}}%20else%20{msg%20+=%20%22If%20you%20select%20some%20text,%20I%27ll%20tell%20you%20what%20font%20it%20is.\%22%22;}alert(msg);') do
          text 'Fonzie'
        end
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
      p do
        text 'Drag this little dude to your bookmarks bar and click it when you\'re on someone\'s timeline. It\'ll put an "RSS" link right under the user\'s bio, for you to click or copy.'
        blockquote.bookmarklet do
          a(:href => 'javascript:(function(){$(%27.profile-details%27).append(%27<a%20href=\%22/statuses/user_timeline/%27+$(%27span.screen-name%27).text().replace(%27@%27,%27%27)+%27.rss\%22>RSS</a>%27);})()') do
            text 'Twitter RSS'
          end
        end
      end
      p do
        b do
          text 'Update:'
        end
        text 'fixed to work in Firefox (thanks to Adam Curry for bug report)'
      end
      p do
        b do
          text 'Update (2011-06-23):'
        end
        text 'now uses twitter screen name, not user id, in RSS URL'
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
