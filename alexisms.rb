here = File.expand_path(File.dirname(__FILE__))
require "#{here}/page"

# Index instead of Page so it inherits the CSS (hack)
class Alexisms < Index
  external :style, <<-CSS
  .content { margin: 2em; max-width: 600px; }
  .saying { margin: 1em; border: 1px solid black; }
  .saying p { margin: .5em 1em; }
  CSS

  def say saying
    div.saying do
      h3 saying
      yield if block_given?
    end
  end

  def main
    div :class => 'content' do
      h1 "Alexisms"

      p 'Sayings I use, only some of which I originally said. Anyone with research on a saying\'s provenance or attribution, please let me know in a comment.'

      say 'A comment is a lie waiting to happen.' do
        p do
          text "Which is not to say comments are bad. But they should ", b("illuminate"), " the code, not merely describe it."
        end
      end
      say '"Legacy" means any program that people are actually using.' do
        p '(Feathers: "Legacy" means "no tests.")'
      end

      say 'Double negatives are not unconfusing.'

      say "The only perfect program is an empty file."

      say 'There\'s no such thing as human error. (Only system error.)'

      say 'It\'s always a people problem. (Jerry Weinberg)'

      say 'If you pay attention to something, it gets better.'

      say 'You can see a lot just by looking. (Yogi Berra)' do
        p 'Mr. Berra wrote a book called "You Can Observe A Lot By Watching" but I prefer to think he was misquoting himself.'
        p do
          text 'Language Log has a take on this quote: '
          a :href => 'http://itre.cis.upenn.edu/~myl/languagelog/archives/005375.html' do
            text 'She was seeing at me'
          end
          text '.'
        end
      end

      say 'Read the error message.' do
        p "Even if it looks like barf, there are pearls in there, and you have to roll up your sleeves and feel around for them."
      end

      say '"Never solve a general problem. There are no general problems." (William Pietri)' do
        p { url "https://clarity.fm/questions/946/answers/2941" }
      end

      say 'Object-Oriented Programming is like teenage sex: ...' do
        p "...everyone says they're doing it; few actually are; and those who are rarely know what they're doing. (Anonymous, via Misko)"
        p 'Here\'s a simple test for whether you\'re doing it right: Is your data in the same class as the methods accessing it? Oh, really? Check again.'
      end

      say 'Encapsulation means putting similar things together, and keeping dissimilar things apart.' do
        p 'Of course, the trick of design is knowing along what axes to group or differentiate items. One rule of thumb that has served me well since the days of Gamelan -- when we were sorting dozens of incoming applets per day into categories -- is:'

        say 'Don\'t look at the item and think, "What category does this item belong in? Look at the category and think, "If I were looking for items in this category, would I want to find this item?"' do
          p 'In other words, make your API fit the mindset of the user, not that of the provider.'
        end
      end

      div.saying do
        h3 do
          a :href => '/web/20120526011007/http://en.wikipedia.org/wiki/Conway\'s_Law' do
            text 'Conway\'s Law'
          end
          text ': "Any piece of software reflects the organizational structure that produced it."'
        end
        p 'Or, "The structure of the code reflects the structure of the coders."'
      end

      say '"Have strong opinions, weakly held." (Paul Saffo)'

    end
  end
end
