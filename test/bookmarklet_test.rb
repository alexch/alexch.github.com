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


## href
assert { href("") == "javascript:" }
assert { href("alert('hi')") == "javascript:alert(%27hi%27)"}

# full fonzie

js = File.read("#{here}/fonzie.js")

exemplar = "javascript:var%20msg%20=%20%22Fonzie%20says:%20%5C%22Ayy!%20%22;var%20sel%20=%20window.getSelection();var%20n%20=%20sel.anchorNode;if%20(n)%20{msg%20+=%20sel%20+%20%27%22%5Cn%27;var%20s%20=%20getComputedStyle(n.parentNode);atts%20=%20[%22font-family%22,%22font-size%22,%22font-style%22,%22font-variant%22,%22font-weight%22,%22line-height%22,%22text-align%22,%22text-decoration%22,%22text-indent%22,%22text-rendering%22,%22text-shadow%22,%22text-overflow%22,%22text-transform%22,%22outline-color%22,%22outline-style%22,%22outline-width%22,%22color%22,%22background-color%22];for%20(var%20i=0;i<atts.length;++i)%20{var%20a=atts[i];v%20=%20s.getPropertyValue(a);if%20(v%20!=%20%22auto%22%20&&%20v%20!=%20%27normal%27%20&&%20v%20!=%20%27none%27)msg%20+=%20a%20+%20%22:%20%22%20+%20v%20+%20%22%5Cn%22;}}%20else%20{msg%20+=%20%22If%20you%20select%20some%20text,%20I%27ll%20tell%20you%20what%20font%20it%20is.%5C%22%22;}alert(msg);"
assert {  href(js) == exemplar }
