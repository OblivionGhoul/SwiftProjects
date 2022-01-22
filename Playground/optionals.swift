// Optional Strings
print("Optional Strings")
var myName = "Minh"
//myName = nil
var greeting: String?

if greeting == nil {
    greeting = "Wassup "
}

greeting! += myName
print(greeting!)

// Optional Ints and Doubles
print("\nOptional Ints and Doubles")
let num1: Int? = 10
let num2: Int? = 50
let double1: Double? = 36.24
let double2: Double? = 71.45

print(num1!)
print(num2!)
print(double1!)
print(double2!)

// Optional Properties
print("\nOptional Properties")
class Person {
    var grade:Int
    var age:Int?
    var name:String

    init(grade: Int = 0, age: Int = 0, name: String = "Person") {
        self.grade = grade
        self.age = age
        self.name = name
    }

    func promote() {
        grade += 1
    }

    func birthdayed() {
        age! += 1
    }

    func print() -> String {
        return("\(name) is in grade \(grade) at age \(age!).")
    }
}

let person = Person(grade: 11, age: 17, name: "Kevin")
person.promote()
person.birthdayed()
print(person.print())