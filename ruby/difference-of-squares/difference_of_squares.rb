class Squares
  attr_reader :square_of_sum, :sum_of_squares, :difference

  def initialize(n)
    range = (1..n)
    @square_of_sum = range.sum ** 2
    @sum_of_squares = range.sum {|x| x ** 2}
    @difference = (@sum_of_squares - @square_of_sum).abs
  end
end