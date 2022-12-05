-- Test data

a :: [Int]
a = [2,5,1,3]

b :: [Int]
b = [1,3,6,2,5]

c :: [Int]
c = [4,4,2,1,1,2,2,4,4,8]

u :: [Int]
u = [2,2,2,2,2,2,2,2,2,2]

x :: [Int]
x = [1,9,2,8,3,7,2,8,1,9]

-------------------------------
-- Functions
-------------------------------


-------------------------------
-- pairwiseValues: Takes a list of Int values as its sole parameter, which 
--                 produces a list of pairs of Int values, such that each element 
--                 of the given list is paired with its successor

pairwiseValues :: [Int] -> [(Int, Int)]
pairwiseValues xs = zipWith (\x y -> (x,y)) xs ( tail xs )