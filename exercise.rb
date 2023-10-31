$: << File.join(__dir__, "lib")

require "area"

def with_fancy_header(msg, width = 100, char = "-", &block)
  puts
  puts char * width
  puts msg.center(width)
  puts char * width
  puts
  yield
  puts
end

begin
  inputs = [1, 8, 6, 2, 5, 4, 8, 3, 7]

  with_fancy_header("Visual Representation") do
    Area.plot_ascii_array(inputs)
  end

  analysis = Area.max(inputs)

  analysis.to_h.each do |stat, value|
    with_fancy_header("Analysis: '#{stat}'") do
      pp value
    end
  end
rescue => e
  puts "Something went wrong: #{e.inspect}"
end
