module IsbnVerifier (isbn) where

isbn_dashes = 3
isbn_length = 10

isbn :: String -> Bool
isbn isbn_str = verify_isbn isbn_str isbn_dashes isbn_length True 0

verify_isbn :: String -> Int -> Int -> Bool -> Int -> Bool
-- the number of elements and checksum will be verified at the end
verify_isbn [] dash_left num_left _ checksum =
  ((dash_left == 0) || (dash_left == isbn_dashes)) &&
  (num_left == 0) &&
  (mod checksum 11 == 0)

verify_isbn (x:xs) dash_left num_left need_num checksum
  | num_left == 0 = False
  | not (isAllowedChar x) = False
  | num_left > 1 && x == 'X' = False
  | need_num && x == '-' = False
  | otherwise = if x == '-'
                then verify_isbn xs (dash_left - 1) num_left True checksum
                else let num = str2num x in
                       verify_isbn xs dash_left (num_left - 1) False (checksum + num_left*num)
  where str2num x
          | x == 'X' = 10
          | otherwise = read [x] :: Int
        isAllowedChar x =
          x `elem` (['0' .. '9'] ++ ['X', '-'])
          
