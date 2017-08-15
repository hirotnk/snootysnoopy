factor :: Int -> [Int]
factor n = [x | x <- [1..(n -1)], n `mod` x == 0]


perfect :: Int -> [Int]
perfect n = [x | x <- [1..n], sum (factor x) == x]

fibs :: [Integer]
fibs = 0:1:zipWith (+) fibs (tail fibs)

fib :: Integer -> Integer
fib n = fst (fib2 n) where fib2 n = if n == 0 then (0,1) else (b,a+b) where (a,b) = fib2 (n-1)

