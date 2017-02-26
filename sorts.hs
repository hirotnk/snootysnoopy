msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort ls) (msort rs) where
           (ls,rs) = halve xs

halve :: [a] -> ([a],[a])
halve xs = ((take n xs), (drop n xs)) where
           n = length xs `div` 2

merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge ls [] = ls
merge [] rs = rs
merge (l:ls) (r:rs) | l > r = r: (merge (l:ls) rs)
                    | otherwise = l: (merge ls (r:rs))


isort :: Ord a => [a] -> [a]
isort [] = []
isort (x:xs) = insert x (isort xs)

insert :: Ord a => a -> [a] -> [a]
insert x []     = [x]
insert x (y:ys) | x > y = y:insert x ys
                | otherwise = x: insert y ys


qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort ls ++ [x] ++ qsort rs where
               ls = [l | l <- xs, l <= x]
               rs = [r | r <- xs, r > x]

