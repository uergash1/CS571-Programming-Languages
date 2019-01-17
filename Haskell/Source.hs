--Question #1
deleteDuplicate :: (Eq a) => [a] -> [a]
deleteDuplicate [] = []
deleteDuplicate (x:xs) 
    | elem x xs = deleteDuplicate xs
    | otherwise = x : deleteDuplicate xs

join :: (Eq a) => [a] -> [a] -> [a]
join [] ls = ls
join (x:xs) lt
    | elem x lt = join xs lt
    | otherwise = x : join xs lt

union :: (Eq a) => [a] -> [a] -> [a]
union lt1 lt2 = join (deleteDuplicate lt1) (deleteDuplicate lt2)



--Question #2
delete :: Int -> [a] -> [a]
delete n xs = helper xs n
   where helper [] _ = []
         helper (x:xs) 1 = helper xs n
         helper (x:xs) k = x : helper xs (k - 1)



--Question #3
data Tree = Leaf Int | Node Tree Int Tree
occurs:: Int -> Tree -> Bool
occurs n (Leaf y)
    | y == n = True
    | otherwise = False
occurs n (Node bt1 n1 bt2)
    | n1 == n = True
    | otherwise = ((occurs n bt1) || (occurs n bt2))



--Question #4
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

deleteFirst :: (Eq a) => a -> [a] -> [a]
deleteFirst n [] = []
deleteFirst n (x:xs)
    | n == x = xs
    | otherwise = x : deleteFirst n xs

delete_last :: (Eq a) => a -> [a] -> [a]
delete_last n ls = reverse' (deleteFirst n (reverse' ls))



--Question #5
isort :: (Ord a) => [a] -> [a]
isort [] = []
isort (x:xs) = insert x (isort xs)

insert :: (Ord a) => a -> [a] -> [a]
insert x [] = [x]
insert x (y:ys)
    | x <= y = x : y : ys
    | otherwise = y : (insert x ys)
