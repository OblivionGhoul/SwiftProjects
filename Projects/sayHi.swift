import SwiftUI

struct ContentView: View {
    private let greetings = ["Wassup", "Hello", "Greetings", "Good Morning", "Sup", "Hi"]
    @State private var greeting = "Enter Your Name And Press The Button"
    @State private var name = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text(greeting)
                    TextField("Name", text: $name)
                    Button("Generate Greeting") {
                        greeting = "\(greetings[Int.random(in: 0..<greetings.count)]) \(name)"
                    }
                }
            }.navigationTitle("Greeting Generator")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}