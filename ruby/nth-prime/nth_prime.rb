class Prime
  @@primes = Enumerator.new do |y|
    num = 2
    factorial = 1
    loop do
      # Wilson's theorem
      # n + 1 is prime if and only if n! mod (n + 1) = n
      # there'll be (n - 1) multiplications and modular operations
      y << num if factorial % num == (num - 1)
      factorial *= num
      num += 1
    end
  end.lazy

  def self.nth n
    raise ArgumentError if n < 1
    @@primes.drop(n - 1).first
  end
end
