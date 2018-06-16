class Integer
  def to_roman(num_to_roman=nil)
    num_to_roman =
        [
            { :arab => 1000, :roman => 'M'},
            { :arab => 900, :roman => 'CM'},
            { :arab => 500, :roman => 'D'},
            { :arab => 400, :roman => 'CD'},
            { :arab => 100, :roman => 'C'},
            { :arab => 90, :roman => 'XC'},
            { :arab => 50, :roman => 'L'},
            { :arab => 40, :roman => 'XL'},
            { :arab => 10, :roman => 'X'},
            { :arab => 9, :roman => 'IX'},
            { :arab => 5, :roman => 'V'},
            { :arab => 4, :roman => 'IV'},
            { :arab => 1, :roman => 'I'}
        ] unless num_to_roman != nil

    return "" if num_to_roman.size == 0

    convert_data = num_to_roman.first
    n = self / convert_data[:arab]
    rem = self % convert_data[:arab]

    convert_data[:roman] * n + rem.to_roman(num_to_roman.drop(1))

  end
end