// Variables
print("Variables")
let myName = "Minh"
// myName = "Not Minh"
var greeting = "Wassup, "
print("\(greeting)\(myName)")
greeting += myName
print(greeting)

// Loops
print("\nLoops")
// counting 1-10
for i in stride(from: 1, to: 11, by: 1) {
print(i)
}
// counting 10-1
for i in stride(from: 1, to: 11, by: 1).reversed() {
print(i)
}
// counting 1-10 (even nums)
for i in stride(from: 2, to: 11, by: 2) {
print(i)
}

// Countdown
print("\nCountdown!")
let startValue = 20
for i in stride(from: 1, to: startValue + 1, by: 1).reversed() {
print(i)
}
print("Happy New Year!")