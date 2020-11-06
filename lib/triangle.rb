require 'pry'

class Triangle
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/PerceivedComplexity

  def kind
    test_arr = [@a, @b, @c]
    if test_arr.any? { |side| side <= 0 } || ((@a + @b <= @c) || (@b + @c <= @a) || (@a + @c <= @b))
      raise TriangleError
    elsif test_arr.all? { |side| side == @a }
      :equilateral
    elsif (@a != @b && @b == @c) || (@a != @b && @c == @a) || (@a == @b && @b != @c)
      :isosceles
    elsif test_arr.uniq
      :scalene
    end
  end

  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/PerceivedComplexity

  class TriangleError < StandardError
    def message
      'These are not triangles!'
    end
  end
end
