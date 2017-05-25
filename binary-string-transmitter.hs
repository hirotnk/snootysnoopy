-- From 7.6 , 'Programming in Haskell' 2nd edition, by Graham Hutton
import Data.Char

main = print (transmit "higher-order functions are easy")

type Bit = Int

bin2int :: [Bit] -> Int
bin2int = foldr (\x y -> x + 2*y) 0

int2bin :: Int -> [Bit]
int2bin 0 = []
int2bin n = n `mod` 2 : int2bin (n `div` 2)

make8 :: [Bit] -> [Bit]
make8 bits = take 8 (bits ++ repeat 0)

encode :: String -> [Bit]
encode = concat . map (addparity . make8 . int2bin . ord)

chop8 :: [Bit] -> [[Bit]]
chop8 [] = []
chop8 bits = take 8 bits : chop8 (drop 8 bits)

chop9 :: [Bit] -> [[Bit]]
chop9 [] = []
chop9 bits = take 9 bits : chop9 (drop 9 bits)

decode :: [Bit] -> String
decode = map (chr . bin2int . checkparity) . chop9

transmit :: String -> String
transmit = decode . channel . encode

channel :: [Bit] -> [Bit]
channel = id

addparity :: [Bit] -> [Bit]
addparity bits = p:bits where
                 p = parity bits

checkparity :: [Bit] -> [Bit]
checkparity (p:bits) | p == parity bits = bits
                     | otherwise = error "parity error"

parity :: [Bit] -> Int
parity bits = (sum bits) `mod` 2

channel2 :: [Bit] -> [Bit]
channel2 = tail
