# Please note: I *loathe* `standardrb`'s ruby linting rules--like being told to
# use `each_with_object` instead of `reduce`, or to omit trailing commas (wth?)...
# But my opinions are less important than code consistency. That said, these
# styles represent `standardrb`'s notion of "good" styles, not my own.

module Area
  extend self # Functions on module.

  # Next method is ChatGPT's response to this prompt:
  # Can you write me some ruby that takes an array of integers, and plots an
  # ascii visualization of those numbers as y values starting at x=0,
  # and ending when the array is exhausted?
  def plot_ascii_array(arr)
    arr.max.downto(1) do |y|
      row = ""
      arr.each { |x| row += (x >= y) ? "*" : " " }
      puts row
    end
    puts "-" * arr.length
    puts (0..(arr.length - 1)).to_a.join("")
  end

  Analysis = Struct.new(
    :inputs,
    :indexes,
    :index_combinations,
    :input_combinations_distance_extrema,
    :areas,
    :max_area
  )

  def analyze(inputs, extrema_store)
    # get all combinations of 2 from array of positions:
    indexes = (0...inputs.length).to_a # [0, 1, ..., n - 1]

    # all "pick 2" index combinations (unique; not permutations)
    index_combinations = indexes.combination(2).to_a

    # Gather `inputs` pairs via index pairs, keeping only the distance extrema
    # (min or max) encountered for each.
    # key: a `Set` (1 <= size <= 2) of numeric values from `inputs` corresponding to
    #      an index combination. different index pairs may refer to the same values
    #      by coincidence; in these cases, only the extram are interesting.
    # val: the extrema of distance delta (min or max) for all encounters of these values
    #  { #<Set: {1, 8}>=>6, #<Set: {8}>=>5, #<Set: {3, 7}>=>1}, ... }
    input_combinations_distance_extrema =
      index_combinations.each_with_object(extrema_store) do |(i1, i2), lookup|
        lookup[Set.new([inputs[i1], inputs[i2]])] = (i2 - i1).abs
      end

    # take the min of two values encountered (the area is constrained by lower) and
    # multiply it by the most extreme distance (min or max) to get candidate area
    areas = input_combinations_distance_extrema.map do |input_combination, extrema|
      input_combination.min * extrema
    end

    # dump a bunch of info:
    Analysis.new(
      inputs, indexes,
      index_combinations,
      input_combinations_distance_extrema,
      areas.sort, areas.max
    )
  end

  class MaximaHash < Hash
    def []=(key, value)
      if self[key].nil? || value > self[key]
        super(key, value)
      end
    end
  end

  def max(inputs)
    analyze(inputs, MaximaHash.new)
  end
end
