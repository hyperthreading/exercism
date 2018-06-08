module RailFenceCipher (encode, decode) where

import Data.List (intercalate, concat, transpose, concatMap)

encode :: Int -> String -> String
encode height text = concatMap concat $ transpose $ toCipher height text

emptyLetter = []

toCipher :: Int -> String -> [[String]]
toCipher k t
  | t == [] = [replicate k emptyLetter]
  | otherwise =
    if length t >= (k - 1) then
      let payload = listOfLetter $ take (k - 1) t in
        (payload ++ [emptyLetter]) : map reverse (toCipher k $ drop (k - 1) t)
    else
      let payload = listOfLetter t
          emptySpace = (k - length t)
          fillout = replicate emptySpace emptyLetter in
        [payload ++ fillout]
  where listOfLetter list = map (\x -> [x]) list

decode :: Int -> String -> String
decode = error "You need to implement this function!"

