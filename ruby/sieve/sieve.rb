class Sieve
  attr_reader :primes

  def initialize n
    @primes = []

    return if n < 2

    nums = (2..n).to_a
    while nums.size > 0
      head = nums.first
      @primes.push head
      nums = nums.select {|n| n % head != 0 }
    end

  end
end