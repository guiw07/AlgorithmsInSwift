//: # Enums & Structs
import UIKit
//: ### Defining an Enumeration
enum PrimaryColor {
    case red
    case blue
    case yellow
}

enum Aunties {
    case aime, billie, diane, gail, janie, pam
}

// raw value type
enum AmericanLeagueWest: String {
    case athletics = "Oakland"
    case astros = "Houston"
    case angels = "Los Angeles"
    case mariners = "Seattle"
    case rangers = "Arlington"
}

var message = "I hope the A's stay in \(AmericanLeagueWest.athletics.rawValue)"

// associated value
enum Subject {
	case math(Int)
	case computerScience(Int)
	case english(String, Int)
	case spanish(String, Int)
	case science(String, Int)
}
var mySubject = Subject.computerScience(100)
var mySubject2 = Subject.english("ESL", 90)

switch mySubject {
case .computerScience(let score) where score > 90:
	print("You are smart!")
default:
	print("Let's study more!")
}




//: Enums and switch statements go hand in hand.
enum CaliforniaPark {
    case yosemite, deathValley, lasson, sequoia
}

var warning = ""
var destination = CaliforniaPark.yosemite

switch destination {
    case .yosemite:
        warning = "Beware of aggressive bears!"
    case .deathValley:
        warning = "Beware of dehydration!"
    case .lasson:
        warning = "Watch out for boiling pools!"
    case .sequoia:
        warning = "Watch out for falling trees!"
}

//: ### Structs with Properties & Methods
//: Example 1
struct PictureFrame {
	// stored property
	var width = 5
	var height = 7
	var thickness: Double = 1.5
	// copyOnWrite
	var area: Int {
		// computed property
		get {
			return width * height
		}
		set(newArea) {
			width = newArea / height
			height = newArea / width
		}
	}
}

//: Structs get memberwise initializers automatically
var familyReunionFrame = PictureFrame(width: 10, height: 8, thickness: 1.5)
familyReunionFrame.area


//: Example 2
// This example has been modified to round more accurately
struct Beer {
    var style = "Pale Ale"
    var percentAlcohol = 5.0
    static var cheersDict = ["English": "Cheers!","German": "Prost!", "Japanese": "乾杯", "Mandarin": "干杯!","Russian":"На здоровье!", "Spanish":"Salud!", "Italian": "Cin cin!"]
    var suggestedVolumePerServing:String {
        get {
            let volume: Int = Int(12.0/(percentAlcohol/5.0))
            return "\(volume) ounces"
        }
    }
 
    static func cheers(_ language: String) {
        if let cheers = cheersDict[language] {
            print("\(cheers)")
        }
    }
}

var happyHourBeer = Beer(style:"Lager", percentAlcohol: 6.0)
happyHourBeer.suggestedVolumePerServing
Beer.cheers("Japanese")

//: ### Structs and Enums are Value Types

//: Value types are copied with every assignment
var frame = PictureFrame(width: 3, height: 5, thickness: 0.5)
var frameForMom = frame
frameForMom.width = 5
frameForMom.height = 7

//: Reference types create a new reference with every assignment, they are NOT copied.
// What happens if we make pictureFrame a class?

class ClassyPictureFrame {
    var width = 5
    var height = 7
    var thickness: Double = 1.5
    
    var area: Int {
        get {
            return (width * height)/2
        }
    }

    init(width: Int, height: Int, thickness: Double) {
        self.width = width
        self.height = height
        self.thickness = thickness
    }

}

var classyFrame = ClassyPictureFrame(width: 3, height: 5, thickness: 0.5)
var classyFrameForMom = classyFrame
classyFrameForMom.width = 5
classyFrameForMom.height = 7

//: ### Choose the right type for the job
// enum, class, or struct? 
// Uncomment each example one at a time as you guess the corresponding answer.

struct Triangle {
    let angles = [30, 60, 90]
    let sides = [3,4,5]
}

enum UIImagePickerControllerSourceType : Int {
    case photoLibrary
    case camera
    case savedPhotosAlbum
}

struct Name {
    var firstName: String
    var lastName: String
}

enum Subject {
    case math
    case english
    case spanish
    case science
}

struct Student {
    var grades = [97.0, 99.0, 98.0]
    let name = Name(firstName:"Grace", lastName:"Hopper")
    var favoriteSubject = Subject.Science

    var gradePointAverage: Double {
        get {
            return (grades.reduce(0){$0 + $1})/Double (grades.count)
        }
    }
}

