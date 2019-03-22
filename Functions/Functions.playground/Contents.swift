//: # Functions

//: ## Global Functions
//: The functions __print__, __min__, __max__, and __abs__ are a few examples of global functions. Check out a complete list of Swift's global functions [here](http://swiftdoc.org/swift-2/func/).
//print
print("I'm a global function!")

//min and max
var initialPrice = 50
var bestOffer = 45
var finalPrice = min(bestOffer, initialPrice)

//abs
var negativeSeven = -7
abs(negativeSeven)


//: ## Methods

//: ## Anatomy of a function

let array = ["A", "13", "B","5","87", "t", "41"]

class Arithmetic {
    func sumOfStrings(_ aBunchOfStrings: [String]) -> Int {
        let array = aBunchOfStrings
        var sum = 0
        for string in array {
					if let intToAdd = Int(string) {
                sum += intToAdd
            }
        }
        return sum
    }
}

//:    func functionName (parameterName: parameterType) -> returnType {
//:        statements to execute
//:        return object
//:     }

let stringToReverse = "Mutable or Immutable? That is the question."

func reverseString(_ stringToReverse: String) {
    var reversedString = ""
    for character in stringToReverse {
        reversedString = "\(character)" + reversedString
    }
    print(reversedString)
}

//:    func functionName (externalParameterName localParameterName: parameterType) -> returnType {
//:        statements to execute
//:        return object
//:     }

//: ## Practice writing function definitions 
//: Example 1 - firstCharacterOf
// TODO: Write the firstCharacterOf function here.
func firstCharacter(Of word: String) -> Character {
	return word[word.startIndex]
}
print(firstCharacter(Of: "Mom"))


//: Example 2 - placeFirstLetterLast
// TODO: Write placeFirstLetterLast function here. 
func placeFirstLetterLast(Of word: String) -> String {
	var word = word
	word.append(firstCharacter(Of: word))
	word.remove(at: word.startIndex)
	return word
}


//: Example 3 - filterByYear
// TODO: Write filterByYear function here.
class MovieArchive {
	func filterByYear(_ year: Int, from movies:[String:Int]) -> [String] {
		var filteredMovies = [String]()
		for (movie, releaseYear) in movies {
			if year == releaseYear {
				filteredMovies.append(movie)
			}
		}
		return filteredMovies
	}
}



var aiThemedMovies:[String:Int] = ["Metropolis":1927, "2001: A Space Odyssey":1968, "Blade Runner":1982, "War Games" : 1983, "Terminator": 1984, "The Matrix":1999, "A.I.":2001, "Her": 2013, "Ex Machina":2015]


let myArchive = MovieArchive()
print(myArchive.filterByYear(2001, from: aiThemedMovies))



