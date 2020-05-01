const cycle = (arr) => [...arr, ...arr, ...arr]

const vigenere = (alphabet, key, message) => {
    return message.split("").map((char, index) => {
        const charIndex = cycle(alphabet).indexOf(char)
        return charIndex != -1 ? cycle(alphabet)[charIndex + key[index]]: char
    })
}

let rersult = vigenere(["a", "b", "c", "d", "e", "f"], [1, 2, 1, 2, 1], "abcdf")
console.log(rersult)
/*
vigenere :: [Char] -> [Int] -> String -> String
vigenere alphabet key message = undefined

Использовать 
cycle - слепливающийся массив [1,2,3] = [1,2,3,1,2,3,1,2,3....]
elemIndex = indexOf
(!!) - получение элемента массива по индексу
zipWith
*/