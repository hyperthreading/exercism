module IsbnVerifier (isbn) where

isbnDashes = 3 :: Int
isbnLength = 10 :: Int

isbn :: String -> Bool
isbn isbn_str = verifyIsbn isbn_str isbnDashes isbnLength True 0

verifyIsbn :: String -> Int -> Int -> Bool -> Int -> Bool
-- the number of elements and checksum will be verified at the end
verifyIsbn [] dashLeft num_left _ checksum =
  ((dashLeft == 0) || (dashLeft == isbnDashes)) &&
  (num_left == 0) &&
  (mod checksum 11 == 0)

verifyIsbn (x:xs) dash_left num_left need_num checksum
  | num_left == 0 = False
  | not (isAllowedChar x) = False
  | num_left > 1 && x == 'X' = False
  | need_num && x == '-' = False
  | otherwise = if x == '-'
                then verifyIsbn xs (dash_left - 1) num_left True checksum
                else let num = str2num x in
                       verifyIsbn xs dash_left (num_left - 1) False (checksum + num_left*num)
  where str2num x
          | x == 'X' = 10
          | otherwise = read [x] :: Int
        isAllowedChar x =
          x `elem` (['0' .. '9'] ++ ['X', '-'])

