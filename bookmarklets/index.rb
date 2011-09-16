class Index < Erector::Widget
  def content
    head do
      title do
        text 'Alex\'s Bookmarklets - New Twitter RSS Bookmarklet, Font Bookmarklet'
      end
      style do
        text 'body { 
    background: rgba(207, 207, 207, 0.898438); 
    font: normal normal normal 13px/1.5 \'Helvetica Neue\', Arial, Helvetica, \'Liberation Sans\', FreeSans, sans-serif;
    margin: 0px;
  }
  
  .main > h1 { margin-left: 1em;}
  .main { 
  margin: 1em auto; 
  padding: 1em; 
    background: white;
    max-width: 42em;

    border-bottom-left-radius: 8px 8px;
    border-bottom-right-radius: 8px 8px;
    border-top-left-radius: 8px 8px;
    border-top-right-radius: 8px 8px;
  }
  h1 { margin-top: 0px;}
  a { text-decoration: none;}
  blockquote a { border: 1px solid gray; background: #DDD; padding: .25em; }
  img { border-style: none; }
  
  
  div.top { 
      border-bottom: 1px solid black; 
      font-size: 9pt;
      background: #EFFEFF;
      padding: .15em .25em .1em;
      min-height: 26px;
      
  }  
  div.footer {
    text-align: center;
    background: #EFFEFF;
    padding: 0 0 2em;
  }
  .footer p {
    margin: .5em;
  }
  
  div.creation {
      padding: .25em;
      float:left;
  }
  div.creation a {  border: 2px solid #a3a3a3; -webkit-border-top-left-radius: 2px 2px; -moz-border-radius-topleft: 2px; -webkit-border-top-right-radius: 2px 2px; -moz-border-radius-topright: 2px; -webkit-border-bottom-left-radius: 2px 2px; -moz-border-radius-bottomleft: 2px; -webkit-border-bottom-right-radius: 2px 2px; -moz-border-radius-bottomright: 2px; margin: 0px; padding: 1px; }
  div.creation a:hover { border-color: red;}
  br.clear { clear: both;}
  
  div.iconistan { float: right;}'
      end
      style do
        text 'div.iconistan { position: relative; padding: 0px; margin: 0px 4px; }
    div.iconistan a { text-decoration: none; font-size: 10pt; }

    div.iconistan div.icon { margin: 2px; float: left; height: 36px; }
    div.iconistan div.icon:nth-child(1) { margin-left: 0px; }

    div.iconistan div.icon div.icon_border { float: left; border: 2px solid #a3a3a3; -webkit-border-top-left-radius: 2px 2px; -moz-border-radius-topleft: 2px; -webkit-border-top-right-radius: 2px 2px; -moz-border-radius-topright: 2px; -webkit-border-bottom-left-radius: 2px 2px; -moz-border-radius-bottomleft: 2px; -webkit-border-bottom-right-radius: 2px 2px; -moz-border-radius-bottomright: 2px; margin: 0px; padding: 1px;}
    div.iconistan div.icon:hover div.icon_border { border: 2px solid red; }

    div.iconistan div.icon img { margin: 0px; }  
    div.iconistan div.icon div.url { position: absolute; top: 27px; left: 2px; }  /* must sync url\'s left and iconistan\'s padding */
    div.iconistan div.icon div.url { visibility: hidden; }
    div.iconistan div.icon:hover div.url { visibility: visible; background: #EFFEFF; border: 1px solid black; padding: 2px 8px; }'
      end
      script :type => 'text/javascript' do
        text '//'
        rawtext '<![CDATA[
      var _gaq = _gaq || [];
      _gaq.push([\'_setAccount\', \'UA-23417120-1\']);
      _gaq.push([\'_setDomainName\', \'none\']);
      _gaq.push([\'_setAllowLinker\', true]);
      _gaq.push([\'_trackPageview\']);

      (function() {
        var ga = document.createElement(\'script\'); ga.type = \'text/javascript\'; ga.async = true;
        ga.src = (\'https:\' == document.location.protocol ? \'https://ssl\' : \'http://www\') + \'.google-analytics.com/ga.js\';
        var s = document.getElementsByTagName(\'script\')[0]; s.parentNode.insertBefore(ga, s);
      })();

  // ]]>'
      end
    end
    body do
      div :class => 'top' do
        div :class => 'creation' do
          text 'An'
          a :href => 'http://alexch.github.com/' do
            text 'Alex Chaffee'
          end
          text 'creation.'
        end
        div :class => 'iconistan' do
          div :class => 'icon' do
            div :class => 'icon_border' do
              a :href => 'http://twitter.com/alexch' do
                img :height => '16', :src => '../icons/twitter.png', :width => '16'
              end
            end
            text ' '
            div :class => 'url' do
              a :href => 'http://twitter.com/alexch' do
                text 'http://twitter.com/alexch'
              end
            end
          end
          div :class => 'icon' do
            div :class => 'icon_border' do
              a :href => 'http://google.com/profiles/alexch' do
                img :height => '16', :src => '../icons/google.png', :width => '16'
              end
            end
            text ' '
            div :class => 'url' do
              a :href => 'http://google.com/profiles/alexch' do
                text 'http://google.com/profiles/alexch'
              end
            end
          end
          div :class => 'icon' do
            div :class => 'icon_border' do
              a :href => 'http://tumblr.com/alexch' do
                img :height => '16', :src => '../icons/tumblr.png', :width => '16'
              end
            end
            text ' '
            div :class => 'url' do
              a :href => 'http://tumblr.com/alexch' do
                text 'http://tumblr.com/alexch'
              end
            end
          end
          div :class => 'icon' do
            div :class => 'icon_border' do
              a :href => 'http://github.com/alexch' do
                img :height => '16', :src => '../icons/github.png', :width => '16'
              end
            end
            text ' '
            div :class => 'url' do
              a :href => 'http://github.com/alexch' do
                text 'http://github.com/alexch'
              end
            end
          end
          div :class => 'icon' do
            div :class => 'icon_border' do
              a :href => 'http://friendfeed.com/alexch' do
                img :height => '16', :src => '../icons/friendfeed.png', :width => '16'
              end
            end
            text ' '
            div :class => 'url' do
              a :href => 'http://friendfeed.com/alexch' do
                text 'http://friendfeed.com/alexch'
              end
            end
          end
          div :class => 'icon' do
            div :class => 'icon_border' do
              a :href => 'http://linkedin.com/in/alexchaffee' do
                img :height => '16', :src => '../icons/linkedin.png', :width => '16'
              end
            end
            text ' '
            div :class => 'url' do
              a :href => 'http://linkedin.com/in/alexchaffee' do
                text 'http://linkedin.com/in/alexchaffee'
              end
            end
          end
          div :class => 'icon' do
            div :class => 'icon_border' do
              a :href => 'http://facebook.com/daycha' do
                img :height => '16', :src => '../icons/facebook.png', :width => '16'
              end
            end
            text ' '
            div :class => 'url' do
              a :href => 'http://facebook.com/daycha' do
                text 'http://facebook.com/daycha'
              end
            end
          end
          div :class => 'icon' do
            div :class => 'icon_border' do
              a :href => 'http://flickr.com/photos/alexchaffee/' do
                img :height => '16', :src => '../icons/flickr.png', :width => '16'
              end
            end
            text ' '
            div :class => 'url' do
              a :href => 'http://flickr.com/photos/alexchaffee/' do
                text 'http://flickr.com/photos/alexchaffee/'
              end
            end
          end
          div :class => 'icon' do
            div :class => 'icon_border' do
              a :href => 'http://pivotallabs.com/users/alex/blog' do
                img :height => '16', :src => '../icons/pivotallabs.png', :width => '16'
              end
            end
            text ' '
            div :class => 'url' do
              a :href => 'http://pivotallabs.com/users/alex/blog' do
                text 'http://pivotallabs.com/users/alex/blog'
              end
            end
          end
          div :class => 'icon' do
            div :class => 'icon_border' do
              a :href => 'http://google.com/reader/shared/alexch' do
                img :height => '16', :src => '../icons/google.png', :width => '16'
              end
            end
            text ' '
            div :class => 'url' do
              a :href => 'http://google.com/reader/shared/alexch' do
                text 'http://google.com/reader/shared/alexch'
              end
            end
          end
          div :class => 'icon' do
            div :class => 'icon_border' do
              a :href => 'http://stinky.com/alex' do
                img :height => '16', :src => '../icons/stinky.png', :width => '16'
              end
            end
            text ' '
            div :class => 'url' do
              a :href => 'http://stinky.com/alex' do
                text 'http://stinky.com/alex'
              end
            end
          end
        end
        text '&nbsp;'
      end
      h1 do
        text 'Alex\'s Bookmarklets'
      end
      a :name => 'fonzie' do
        div :class => 'main' do
          h1 do
            text 'Fonzie'
          end
          p do
            b do
              text 'Install:'
            end
            text 'Drag the link below to your bookmarks bar.'
          end
          blockquote do
            a(:href => 'javascript:var%20msg%20=%20%22Fonzie%20says:%20\%22Ayy!%20%22;var%20sel%20=%20window.getSelection();var%20n%20=%20sel.anchorNode;if%20(n)%20{msg%20+=%20sel%20+%20%27%22\n%27;var%20s%20=%20getComputedStyle(n.parentNode);atts%20=%20[%22font-family%22,%22font-size%22,%22font-style%22,%22font-variant%22,%22font-weight%22,%22line-height%22,%22text-align%22,%22text-decoration%22,%22text-indent%22,%22text-rendering%22,%22text-shadow%22,%22text-overflow%22,%22text-transform%22,%22outline-color%22,%22outline-style%22,%22outline-width%22,%22color%22,%22background-color%22];var%20skip_values=[%22auto%22,%27normal%27,%27none%27,%270px%27,%27rgb(0,%200,%200)%27,%27rgba(0,%200,%200,%200)%27,%27rgb(255,%20255,%20255)%27];for%20(var%20i=0;i<atts.length;++i)%20{var%20a=atts[i];v%20=%20s.getPropertyValue(a);var%20skip%20=%20false;for%20(var%20j=0;j<skip_values.length;++j)%20{if%20(v%20==%20skip_values[j])%20{skip%20=%20true;}}if%20(!skip%20&&%20!(a==%22text-align%22%20&&%20v==%22left%22))%20{msg%20+=%20a%20+%20%22:%20%22%20+%20v%20+%20%22\n%22;}}}%20else%20{msg%20+=%20%22If%20you%20select%20some%20text,%20I%27ll%20tell%20you%20what%20font%20it%20is.\%22%22;}alert(msg);') do
              text 'Fonzie'
            end
          end
          p do
            b do
              text 'Usage:'
            end
            text 'Select some text on the page. Click the "Fonzie" bookmark link. See the font.'
          end
          p do
            b do
              text 'Source:'
            end
            a :href => 'http://github.com/alexch/fonzie' do
              text 'hosted on GitHub'
            end
          end
          p do
            b do
              text 'Update:'
            end
            text 'Fonzie gets a bit cooler, now skipping common values like "0px" and "none".'
          end
          a :name => 'twitterrss' do
            div :class => 'main' do
              h1 do
                text 'New Twitter RSS Bookmarklet'
              end
              p do
                text 'The New Twitter UI doesn\'t show an RSS feed for the user you\'re looking at anymore. Instead, it only shows you an RSS feed for your own tweets, which seems sort of vainglorious to me.'
              end
              p do
                text 'Here\'s a bookmarklet, written by'
                a :href => 'http://twitter.com/jacobrothstein' do
                  text '@jacobrothstein'
                end
                text 'and converted by'
                a :href => 'http://twitter.com/alexch' do
                  text '@alexch'
                end
                text 'using Gruber\'s'
                a :href => 'http://daringfireball.net/2007/03/javascript_bookmarklet_builder' do
                  text 'Bookmarklet Builder'
                end
                text 'script.'
              end
              p do
                text 'Drag this little dude to your bookmarks bar and click it when you\'re on someone\'s timeline. It\'ll put an "RSS" link right under the user\'s bio, for you to click or copy.'
                blockquote do
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
          end
          div :class => 'footer' do
            hr do
              p do
                text 'All bookmarklets on this page were written (or improved) by'
                a :href => 'http://alexch.github.com' do
                  text 'Alex Chaffee'
                end
                text 'and are in the public domain. If you like them, drop me a line.'
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
      end
    end
  end
end

if __FILE__ == $0
  system "erector --to-html #{__FILE__}"
end
