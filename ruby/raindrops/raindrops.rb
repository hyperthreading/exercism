class Raindrops
  def self.convert n
    rainspeak = { 3 => "Pling",
                  5 => "Plang",
                  7 => "Plong" }
                  .each_pair
                  .map { | denom, speak | (speak if n % denom == 0) }
                  .join
    return rainspeak unless rainspeak == ""
    n.to_s
  end
end
