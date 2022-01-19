class Person {
    var grade:Int
    var age:Int
    var name:String
    
    init() {
        self.grade = 0
        self.age = 0
        self.name = "Person"
    }
    
    func promote() {
        grade += 1
    }
    
    func birthdayed() {
        age += 1
    }
    
    func print() -> String {
        return("\(name) is in grade \(grade) at age \(age).")
    }
}

// Main part of program
var person1 = Person()
person1.birthdayed()
person1.birthdayed()
person1.birthdayed()
person1.birthdayed()
person1.birthdayed()
person1.promote()
person1.name = "Cole"
print(person1.print())

var person2 = Person()
person2.birthdayed()
person2.birthdayed()
person2.birthdayed()
person2.birthdayed()
person2.birthdayed()
person2.birthdayed()
person2.promote()
person2.promote()
person2.name = "James"
print(person2.print())

print(person1.age == person2.age)
print(person1.name == person2.name)
print(person1.grade == person2.grade)