class Page < Erector::Widgets::Page
  extend Rounded

  external :style, <<-STYLE
  .clear { clear: both; }
  body { 
    font-family: 'Optima', 'Trebuchet MS', Gill Sans, Tahoma, Geneva, sans-serif;	
    margin: 0px;
  }

  h1 { margin: 0; }
  h2 {margin-bottom: .5em;}
  img { border-style: none; }

  h3 a { text-decoration: none; }
  a { color: #0000dd; }
  a:hover { color: red; }
  a:visited { color: #4E3EFF; }
  
  #top .logo a { color: black; text-decoration: none; }
  STYLE
  
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

  def icon_dir
    "icons"
  end

  def iconistan
    widget Iconistan, :dir => icon_dir,
      :sites => [
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
   
   def head_content
     super
     link :rel=>"stylesheet", :href=>"http://f.fontdeck.com/s/css/u5mYSdgdXljzmDHdstX1xDoEPik/alexch.github.com/1443.css", :type=>"text/css"
   end

   def body_content
     div :id => "top" do
       iconistan
       div.logo {
         b do
           a "Alex Chaffee", :href => "/"
         end
         a "alex@stinky.com", :class => "email", :href => "mailto:alex@stinky.com"
       }
     end

     main

     div.clear
     footer
   end

   # todo: test anchor_name
   def section name, anchor_name = name.gsub(/\s/, '').downcase
     a :name => anchor_name
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
  
end