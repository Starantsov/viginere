import Data.List

vigenere :: [Char] -> [Int] -> String -> String
vigenere alphabet keys message = do
    zipWith shiftChar message keys

    where
        shiftChar char key = if getIndexOfCharInAlphabet char /= -1 
            then ((cycle alphabet) !! (getPositiveIndex ((getIndexOfCharInAlphabet char) + key)))
            else char
        getIndexOfCharInAlphabet char = case elemIndex char alphabet of
            Just n  -> n
            Nothing -> -1
        getPositiveIndex index = if index > 0 then index else ((length alphabet) + index)

decodeVigenere :: [Char] -> [Int] -> String -> String
decodeVigenere alphabet keys message = do
    let reversedSignKeys = zipWith (*) (replicate (length keys) (-1)) keys
    vigenere alphabet reversedSignKeys message

main :: IO ()
main = do 
    let result = vigenere ['a', 'b', 'c', 'd', 'e', 'f'] [-1, 5, 1, 2, 1, 1] "abcdfz"
    let decodedMessage = decodeVigenere ['a', 'b', 'c', 'd', 'e', 'f'] [-1, 5, 1, 2, 1, 1] result
    print ("Encoded to: " ++ result)
    print ("Decoded to: " ++ decodedMessage)

