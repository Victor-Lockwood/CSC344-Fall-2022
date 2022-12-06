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


-------------------------------
-- pairwiseDifferences: Takes a list of Int values as its sole parameter, 
--                      which produces a list of Int values consisting of 
--                      pairwise differences of each element in the list 
--                      with its successor

pairwiseDifferences :: [Int] -> [Int]
pairwiseDifferences xs = map ( \(x,y) -> x - y ) ( pairwiseValues xs )


-------------------------------
-- pairwiseSums: Takes a list of Int values as its sole parameter, 
--                      which produces a list of Int values consisting of 
--                      pairwise sums of each element in the list 
--                      with its successor

pairwiseSums :: [Int] -> [Int]
pairwiseSums xs = map ( \(x,y) -> x + y ) ( pairwiseValues xs )


half :: Int -> Double
half number = ( fromIntegral number ) / 2


-------------------------------
-- pairwiseHalves: Takes a list of Int values as its sole parameter, 
--                 which produces a list of Double values by dividing 
--                 each value in the input list by 2

pairwiseHalves :: [Int] -> [Double]
pairwiseHalves xs = map half xs


-------------------------------
-- pairwiseHalfSums: Takes a list of Int values as its sole parameter, 
--                   which produces a list of Double values by dividing 
--                   each pairwise sum by 2

pairwiseHalfSums :: [Int] -> [Double]
pairwiseHalfSums xs = pairwiseHalves ( pairwiseSums xs )