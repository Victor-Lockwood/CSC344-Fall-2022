-------------------------------
-- File: numeric_functions.hs
-------------------------------


-------------------------------
-- squareArea: Takes one real number representing the side length
-- of a square and returns the area 

squareArea :: Num a => a -> a
squareArea side = side * side


-------------------------------
-- circleArea: Takes one real number representing the radius
-- of a circle and returns the area 

circleArea :: Floating a => a -> a
circleArea side = side * side * pi


-------------------------------
-- blueAreaOfCube: Calculates the blue area of a blue cube with
-- a white dot with radius 1/4 the length of a side on each face

blueAreaOfCube :: Floating a => a -> a
blueAreaOfCube side = ( 6 * sideArea ) - ( 6 * whiteArea )
    where sideArea = squareArea side
          whiteArea = circleArea ( side / 4 )


-------------------------------
-- paintedCube1: Takes order n for a painted cube made up of n * n * n smaller cubes
-- and return number of cubes with only 1 face painted
paintedCube1 :: Integer -> Integer
paintedCube1 n = 
    if n > 2 then
        ( ( n - 2 ) ^ 2 ) * 6
    else 
        0

-------------------------------
-- paintedCube2: Takes order n for a painted cube made up of n * n * n smaller cubes
-- and return number of cubes with only 2 faces painted
paintedCube2 :: Integer -> Integer
paintedCube2 n = 
    if n > 2 then
        ( ( n - 2 ) * 12 )
    else 
        0