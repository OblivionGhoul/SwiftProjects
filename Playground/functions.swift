// greet function
func retroGreet(name: String) -> String {
   return("Wassup breh, welcome \(name) to da crib.")
}
var greeting = retroGreet(name: "James")
print(greeting)

// roll function
func getRoll(n: Int) -> Int {
   return(Int.random(in: 1...n))
}
var roll = getRoll(n: 6)
print(roll)

// rollPair function
func rollPair(n: Int) -> (Int, Int) {
   let roll1 = getRoll(n: n)
   let roll2 = getRoll(n: n)
   return(roll1, roll2)
}
var rolls = rollPair(n: 10)
print(rolls)

// isSnakeEyes function
func isSnakeEyes(rolls: (Int, Int)) -> Bool {
   return(rolls.0 == rolls.1)
}
print(isSnakeEyes(rolls: (3, 3)))

// Looping for snake eyes
while true {
   let snakeRolls = rollPair(n: 6)
   if isSnakeEyes(rolls: snakeRolls) {
       print("Yay, you got snake eyes! Your Roll: \(snakeRolls)")
       break
   }
}