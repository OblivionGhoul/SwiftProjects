//
//  ContentView.swift
//  ImageQuizzer
//
//  Created by Minh Dinh on 2/16/22.
//

import SwiftUI

struct QuizImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .clipShape(Circle())
            .shadow(radius: 10)
    }
}

extension View {
    func imageStyle() -> some View {
        modifier(QuizImage())
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var attempts = 0
    
    @State private var characters = ["Esdeath", "Kanna", "Mai", "Marin", "ZeroTwo", "Rem", "Ram", "Akame", "Mikasa", "Asuna", "Mio", "Yui", "Nezuko", "Mitsuri", "Rui", "Nobara", "Rikka", "Suzune", "Shinobu", "Emilia"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(colors: [.blue, .green], startPoint: .leading, endPoint: .topTrailing)
                )
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                Spacer()

                Group {
                    Text("Guess The")
                    Text("Anime Character")
                }
                .font(.largeTitle.bold())
                .foregroundColor(.white)
                .shadow(radius: 10)
                .multilineTextAlignment(.center)
                    

                VStack(spacing: 30) {
                    Text(characters[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    

                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(characters[number])
                                .resizable()
                                .imageStyle()
                        }
                    }
                }

                Spacer()
                Spacer()

                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())

                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("New Game", role: .destructive, action: reset)
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score) out of \(attempts) attempts.")
        }
    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "CORRECT 😁"
            score += 1
            attempts += 1
        } else {
            scoreTitle = "INCORRECT 😖"
            attempts += 1
        }

        showingScore = true
    }

    func askQuestion() {
        characters.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset() {
        score = 0
        attempts = 0
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
