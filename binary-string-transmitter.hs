import Data.Char

main = print (bin2int [1,0,1,1])

type Bit = Int

bin2int :: [Bit] -> Int
bin2int bits = sum [w*b | (w,b) <- zip weights bits]
               where weights = iterate (*2) 1

-- from 'Programing in Haskell' 2nd edition
-- 7.6
-- iterate f x = [x, f x, f (f x), f (f (f x)), ...]
--
-- [/Users/yoshi/gith/snootysnoopy%] runghc binary-string-transmitter.hs
-- 13
--
