factor :: Int -> [Int]
factor n = [x | x <- [1..n], n `mod` x == 0]

is_prime :: Int -> Bool
is_prime x = factor x == [1,x]

-- from Programming in Haskell 2nd edition, Ch5.2
primes :: Int -> [Int]
primes n = [x | x <- [1..n], is_prime(x)]

-- I saw this first in Dave Thomas' Elixir book
primes' ::  Int -> [Int]
primes' n = filter (\a -> notElem a l) [2..n]
            where l = [x*y | x <- [2..n], y <- [2..n]]

-- Eratosthenes' sieve, from Programming in Haskell 2nd edition, Ch15.6
primes'' :: Int -> [Int]
primes'' n = sieve [2..n]

sieve :: [Int] -> [Int]
sieve [] = []
sieve (x:xs) = x:sieve [k|k <- xs, k `mod` x /= 0]

