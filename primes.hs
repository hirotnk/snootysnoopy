factor :: Int -> [Int]
factor n = [x | x <- [1..n], n `mod` x == 0]

is_prime :: Int -> Bool
is_prime x = factor x == [1,x]

prime_factors :: Integer -> [Integer]
prime_factors 1 = []
prime_factors n = p : prime_factors (n `div` p)
                  where p = head [k | k <- [2..r] ++ [n], n `mod` k == 0]
                        r = floor $ sqrt $ fromInteger n

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

-- And of course, the lazy version in the above book:
primes''' :: [Int]
primes''' = sieve_lazy [2..]

sieve_lazy :: [Int] -> [Int]
sieve_lazy (x:xs) = x:sieve_lazy [k|k <- xs, k `mod` x /= 0]
