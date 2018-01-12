module LeapYear (isLeapYear, modular) where

isLeapYear :: Integer -> Bool
isLeapYear year = year `divisibleBy` 4 && not (year `divisibleBy` 100) || (year `divisibleBy` 400)

divisibleBy x y = modular x y == 0

modular :: Integer -> Integer -> Integer
modular x y = last [x, x - y .. 0]
