import Data.List

main :: IO ()

vigenere :: [Char] -> [Int] -> String -> String
vigenere alphabet keys message = do
    map getShiftedChar message
    where 
        getShiftedChar char = if getIndexOfCharInAlphabet char /= -1 
            then ((cycle alphabet) !! (getShiftedIndexOf char)) 
            else char
        getShiftedIndexOf char = ((getIndexOfCharInAlphabet char) + (keys !! (getIndexOfCharInMessage char)))
        getIndexOfCharInMessage char = case elemIndex char message of
            Just n  -> n
            Nothing -> 0
        getIndexOfCharInAlphabet char = case elemIndex char alphabet of
            Just n  -> n
            Nothing -> -1

main = do 
    let result = vigenere ['a', 'b', 'c', 'd', 'e', 'f'] [1, 2, 1, 2, 1] "abcdfo"
    print (result)