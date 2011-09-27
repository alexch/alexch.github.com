require "wrong"
include Wrong

here = File.expand_path(File.dirname(__FILE__))

$: << "#{here}/.."
require "lib/bookmarklet"

def href h
  Bookmarklet.new(h).href
end

def squished h
  Bookmarklet.new(h).squished
end

def escaped h
  Bookmarklet.new(h).escaped
end

## squish

def check_squish js, expected
  assert { squished(js) ==  expected }
end

# kill comments
check_squish "  // foo\nbar", "bar"

# tabs to spaces
check_squish "foo\tbar", "foo bar"

# space runs to single space
check_squish "foo      bar", "foo bar"

# trim
check_squish "  foo  ", "foo"

check_squish "foo();\nbar();\n", "foo();bar();"


# Escape single- and double-quotes, spaces, control chars, unicode:
# $bookmarklet = "javascript:" .
#     uri_escape_utf8($bookmarklet, qq('" \x00-\x1f\x7f-\xff));


def check_escaped js, expected
  assert { escaped(js) == expected }
end

check_escaped "plain", "plain"
check_escaped "alert('hi')", "alert(%27hi%27)"
check_escaped %q(alert("hi")), "alert(%22hi%22)"
check_escaped "backslash\\", "backslash%5C"

def check_parse js
  # puts "--- executing\n#{js}\n\n"
  
  # To install node and jsdom:
  #  curl http://npmjs.org/install.sh | sh
  #  npm install jsdom

  require "open3"
  File.open("/tmp/tmp.js", "w") do |f|
    f.write <<-JAVASCRIPT
var jsdom = require('jsdom');
jsdom.env('<html></html>', [], function(errors, window) {
  window.getSelection = function(){
    return {anchorNode: null};
  };
//  function alert(s) { window.alert(s); }
  function alert(s) { console.log(s); }
#{js}
})
    JAVASCRIPT
  end  
  stdout, stderr, status = 
    Open3.capture3(
      {"NODE_PATH"=> "/usr/local/lib/node_modules"},
      "/usr/bin/env node /tmp/tmp.js"
    )
  if status.exitstatus == 0
    stdout
  else
    require "json"
    result = {:js => js, :stderr => stderr, :stdout => stdout}
    raise JavaScriptError, result
  end
end

class JavaScriptError < Exception
  attr_accessor :result
  def initialize result
    super("JavaScript Execution Error: #{result[:stderr]}")
    @result = result
  end
end

capturing {
  puts check_parse "alert('hi')"
}
e = rescuing {
  capturing {
    check_parse "asldfkj"
  }
}
deny { e.nil? }

## href
assert { href("") == "javascript:(function(){})()" }
assert { href("alert('hi')") == "javascript:(function(){alert('hi')})()"}

# full fonzie

js = File.read("#{here}/../bookmarklets/fonzie.js")
capturing {
  check_parse js
}
capturing {
  check_parse squished(js)
}
