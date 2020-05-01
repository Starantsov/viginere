import Data.List

vigenere :: [Char] -> [Int] -> String -> String
vigenere alphabet keys message = do
    zipWith shiftChar message (cycle keys)

    where
        shiftChar char key = if getIndexOfCharInAlphabet char /= -1 
            then (alphabet !! (mod ((getIndexOfCharInAlphabet char) + key) (length alphabet)))
            else char
        getIndexOfCharInAlphabet char = case elemIndex char alphabet of
            Just n  -> n
            Nothing -> -1

decodeVigenere alphabet keys message = vigenere alphabet (map negate keys) message    

main :: IO ()
main = do 
    let result = vigenere ['a', 'b', 'c'] [-4, 10] "abc"
    let decodedMessage = decodeVigenere ['a', 'b', 'c', 'd', 'e', 'f'] [-1, 2] result
    print ("Encoded to: " ++ result)
    print ("Decoded to: " ++ decodedMessage)

