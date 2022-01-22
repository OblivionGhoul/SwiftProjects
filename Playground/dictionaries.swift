// Arrays
var days = ["Theftera", "Triti", "Tetarti", "Pemti", "Paraskevi"]
days.append("Sabato")
days += ["Kiriaki"]
days[5] = "Saturday"

for i in 0..<days.count {
   print("Day: \(days[i]), Index: \(i)")
}

// Dictionaries
class Person {
   var grade:Int
   var age:Int
   var name:String
   var studentDict = [222222: "James", 222223: "Cole", 222224: "Minh", 222225: "Alex", 222226: "Ethan"]

   init(grade: Int = 0, age: Int = 0, name: String = "Person") {
       self.grade = grade
       self.age = age
       self.name = name
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

let person = Person()
print(person.studentDict)
person.studentDict[222227] = "Nathan"
person.studentDict.removeValue(forKey: 222224)
print(person.studentDict)