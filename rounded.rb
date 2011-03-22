module Rounded
  def rounded(*sides)
    radius = if sides.first.is_a? Fixnum
      sides.shift
    else
      5
    end
    sides = %w{top bottom} if sides.empty?
    sides.collect do |v|
      %w{left right}.collect do |h|
        ["-webkit-border-#{v}-#{h}-radius: #{radius}px #{radius}px",
        "-moz-border-radius-#{v}#{h}: #{radius}px"]
      end
    end.flatten.join("; ")
  end
end
