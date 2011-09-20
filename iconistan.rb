require 'rubygems'
require 'erector'
require './rounded'

Widget = Erector::Widget unless Object.const_defined?(:Widget)

class Iconistan < Erector::Widget
  extend Rounded
  external :style, <<-CSS
  div.iconistan { position: relative; padding: 0px; margin: 0px 4px; }
  div.iconistan a { text-decoration: none; font-size: 10pt; }

  div.iconistan div.icon { margin: 2px; float: left; height: 36px; }
  div.iconistan div.icon:nth-child(1) { margin-left: 0px; }

  div.iconistan div.icon div.icon_border { float: left; 
    border: 2px solid #a3a3a3; #{rounded(2)}; margin: 0px; padding: 1px;
    background-color: white;
  }
  div.iconistan div.icon:hover div.icon_border { border: 2px solid red; }

  div.iconistan div.icon img { margin: 0px; }  
  div.iconistan div.icon div.url { position: absolute; top: 28px; left: 2px; /* must sync url's left and iconistan's padding */
   background: #EFFEFF; border: 1px solid black; padding: 2px 8px; }
  div.iconistan div.icon div.url { visibility: hidden; }
  div.iconistan div.icon:hover div.url { visibility: visible; }
  CSS
  
  needs :sites, :dir => "icons"
  
  # todo: test
  class Site < Widget
    needs :url, :dir
    
    def initialize options
      super
      @domain = @url.match(/https?:\/\/([^.]*)\./)[1]
      @img = "#{@dir}/#{@domain}.png"
    end
    
    def content
      div.icon do
        div.icon_border do
          a :href => @url do
            img :src => @img, :height => 16, :width => 16
          end
        end
        text nbsp(" ")
        div.url do
          url @url
        end
      end
    end
  end
  
  def sites
    @sites.map{|url| Site.new(url: url, dir: @dir)}
  end
  
  def content
    div.iconistan do
      sites.each do |site|
        widget site
      end
    end
  end
end
