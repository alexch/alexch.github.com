here = File.expand_path(File.dirname(__FILE__))
require "#{here}/page"

# Index instead of Page so it inherits the CSS (hack)
class Alexisms < Index
  external :style, <<-CSS
  .content { margin: 2em; max-width: 600px; }
  CSS
  def main
    div :class => 'content' do
      h1 "Alexisms"

      p do
        text 'Sayings I use, only some of which are actually originally attributable to me. Anyone with research on a saying\'s provenance, feel free to comment. This page, unlike a normal blog entry, will be updated as needed with stuff I find myself saying with air quotes.'
      end
      h4 do
        text 'A comment is a lie waiting to happen.'
      end
      h4 do
        text '"Legacy" means any program that people are actually using.'
      end
      p do
        text '(Feathers: "Legacy" means "no tests.")'
      end
      h4 do
        text 'If you try hard enough, you can make anything fail.'
      end
      h4 do
        text 'There\'s no such thing as human error. (Only system error.)'
      end
      h4 do
        text 'If you pay attention to something, it gets better.'
      end
      h4 do
        text 'It\'s always a people problem. (Jerry Weinberg)'
      end
      h4 do
        text 'You can see a lot by looking. (Yogi Berra)'
      end
      p do
        text 'Yogi wrote a book called "You Can Observe A Lot By Watching" but I prefer to think he was misquoting himself.'
      end
      p do
        text 'Language Log has a take on this quote:'
        a :href => '/web/20120526011007/http://itre.cis.upenn.edu/~myl/languagelog/archives/005375.html' do
          text 'She was seeing at me'
        end
      end
      h4 do
        text 'Object-Oriented Programming is like teenage sex: everyone says they\'re doing it; few actually are; and those who are rarely know what they\'re doing. (Anonymous, via Misko)'
      end
      p do
        text 'Here\'s a simple test for whether you\'re doing it right: Is your data in the same class as the methods accessing it? Oh, really? Check again.'
      end
      h4 do
        text 'Double negatives are not unconfusing.'
      end
      h4 do
        text 'Encapsulation means putting similar things together, and keeping dissimilar things apart.'
      end
      p do
        text 'Of course, the trick of design is knowing along what axes to group or differentiate items. One rule of thumb that has served me well since the days of Gamelan -- when we were sorting dozens of incoming applets per day into categories -- is:'
      end
      h4 do
        text 'Don\'t look at the item and think, "What category does this item belong in? Look at the category and think, "If I were looking for items in this category, would I want to find this item?"'
      end
      p do
        text 'In other words, make your API fit the mindset of the user, not that of the provider.'
      end
      h4 do
        a :href => '/web/20120526011007/http://en.wikipedia.org/wiki/Conway\'s_Law' do
          text 'Conway\'s Law'
        end
        text ': "Any piece of software reflects the organizational structure that produced it."'
      end
      p do
        text 'Or, "The structure of the code reflects the structure of the coders."'
      end
      h4 do
        text 'Read the error message.'
      end
    end
  end
end
