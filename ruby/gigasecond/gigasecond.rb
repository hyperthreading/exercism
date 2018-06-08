module Gigasecond
  def from birthtime
    birthtime + 10**9
  end

  module_function :from
end
