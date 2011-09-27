require 'uri'

class Bookmarklet
  def initialize script
    @script = script
  end
  
  def squished
    @script.split("\n").map do |line|
      line.gsub! /^\s*\/\/.+$/, ''  # Kill comments.
      line.gsub! /\t/, ' '          # Tabs to spaces
      line.gsub! /[ ]{2,}/, ' '     # Space runs to one space
      line.strip!
      line
    end.join
  end
  
  def escaped
    p = URI::Parser.new
    unsafe = Regexp.new(%q(['"\\\\ \x00-\x1f\x7f-\xff]), false, 'n')    
    p.escape squished, unsafe
  end
  
  def href    
    "javascript:(function(){#{squished}})()"
  end
end

