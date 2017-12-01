import Data.Char

reverseCaptcha :: [Char] -> Int
reverseCaptcha xs = sum [x | (i, x) <- l, x == second(l!!(mod (i + 1) (length l)))]
  where l = zip [0..] [digitToInt x | x <- xs]

second :: (Int, Int) -> Int
second (a,b) = b
