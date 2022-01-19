// Map
enum Direction {
    case Up
    case Down
    case Left
    case Right
}

var location = (x: 5, y: 2)

var steps: [Direction] = [.Up, .Right, .Up, .Right, .Up, .Right, .Down, .Right]

print("Initial Location: \(location)")

func move(dir: Direction)  {
    switch dir {
    case .Up:
        location.x += 1
    case .Down:
        location.x -= 1
    case .Left:
        location.y -= 1
    case .Right:
        location.y += 1
    }
}

for step in steps {
    move(dir: step)
}

print("Final Location: \(location)")

// RPS
enum HandShape {
    case Rock
    case Paper
    case Scissors
}

enum MatchResult {
    case Win
    case Draw
    case Lose
}

func match(hand1: HandShape, hand2: HandShape) -> MatchResult {
    switch (hand1, hand2) {
    case (.Rock, .Paper):
        return .Lose
    case (.Paper, .Rock):
        return .Win
    case (.Paper, .Scissors):
        return .Lose
    case (.Scissors, .Paper):
        return .Win
    case (.Rock, .Scissors):
        return .Win
    case (.Scissors, .Rock):
        return .Lose
    default:
        return .Draw
    }
}

print(match( hand1: .Scissors, hand2: .Scissors))

// Tuple Counter
var strings = ["tuples", "are", "awesome", "tuples", "are", "cool", "tuples", "tuples", "tuples", "shades"]

var countedStrings: [(String, Int)] = []

for word in strings {
    var isCounted = false
    
    for i in stride(from: 0, to: countedStrings.count, by: 1) {
        if word == countedStrings[i].0 {
            countedStrings[i].1 += 1
            isCounted = true
        }
    }

    if isCounted == false {
        countedStrings.append((word, 1))
    }
}

print(countedStrings)