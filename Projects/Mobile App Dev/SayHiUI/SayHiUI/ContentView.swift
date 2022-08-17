//
//  ContentView.swift
//  SayHiUI
//
//  Created by Minh Dinh on 2/4/22.
//

import SwiftUI

struct ContentView: View {
    private let greetings = ["Wassup", "Hello", "Greetings", "Good Morning", "Sup", "Hi"]
    @State private var greeting = "Enter Your Name And Press The Button"
    @State private var name = ""
    @State private var validName = true
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text(greeting)
                    
                    TextField("Name", text: $name)
                    
                    Button("Generate Greeting") {
                        if (name.lowercased() == "minh" || name.lowercased() == "james" || name.lowercased() == "cole") {
                            validName = false
                            greeting = "Non-Valid Name: \(name)"
                        } else {
                            greeting = "\(greetings[Int.random(in: 0..<greetings.count)]) \(name)"
                        }
                    }
                    .foregroundColor(validName ? .blue : .red)
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
