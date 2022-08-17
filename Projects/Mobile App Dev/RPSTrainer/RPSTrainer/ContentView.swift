//
//  ContentView.swift
//  RPSTrainer
//
//  Created by Minh Dinh on 3/25/22.
//

import SwiftUI

struct ContentView: View {
    private let moves = ["Rock", "Paper", "Scissors"]
    @State var compChoice = Int.random(in: 0...2)
    @State var shouldWin = Bool.random()
    @State var score = 0
    @State var attempts = 0
    @State var alertMessage = ""
    @State var alertTitle = ""
    @State var showAlert = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(colors: [.red, .yellow], startPoint: .leading, endPoint: .topTrailing)
                )
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("My Move: \(moves[compChoice])")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                    .multilineTextAlignment(.center)
                if (shouldWin) {
                    Text("Try To Win")
                        .font(.title)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                } else {
                    Text("Try To Lose")
                        .font(.title)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                
                VStack(spacing: 30){
                    Button("Rock") {
                        checkAnswer("Rock")
                    }
                    .buttonStyle(AnswerButton())
                    
                    Button("Paper") {
                        checkAnswer("Paper")
                    }
                    .buttonStyle(AnswerButton())
                    
                    Button("Scissors") {
                        checkAnswer("Scissors")
                    }
                    .buttonStyle(AnswerButton())
                }
                Spacer()
                
                Text("Score: \(score) / \(attempts)")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }.alert(alertTitle, isPresented: $showAlert) {
                Button("Continue", action: next)
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    struct AnswerButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(Color.cyan)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .scaleEffect(configuration.isPressed ? 1.2 : 1)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        }
    }
    
    func next() {
        compChoice = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
    
    func checkWin(_ pChoice: String, _ cChoice: String) -> Bool {
        if (pChoice == "Rock" && cChoice == "Scissors") {
            return true
        } else if (pChoice == "Rock" && cChoice == "Paper") {
            return false
        } else if (pChoice == "Paper" && cChoice == "Rock") {
            return true
        } else if (pChoice == "Paper" && cChoice == "Scissors") {
            return false
        } else if (pChoice == "Scissors" && cChoice == "Paper") {
            return true
        } else if (pChoice == "Scissors" && cChoice == "Rock") {
            return false
        } else {
            return false
        }
    }
    
    func checkAnswer(_ butName: String) {
        if (butName == moves[compChoice]) {
            score -= 1
            attempts += 1
            
            if (attempts == 10) {
                alertTitle = "Game Over! 🤯"
                alertMessage = "Your final score is \(score) out of \(attempts) attempts."
            } else {
                alertTitle = "You Tied! 🤬"
                alertMessage = "Your score is \(score) out of \(attempts) attempts."
            }
            
            showAlert = true
            return
        }
        
        if (shouldWin) {
            if (checkWin(butName, moves[compChoice])) {
                score += 1
                attempts += 1
                if (attempts == 10) {
                    alertTitle = "Game Over! 🤯"
                    alertMessage = "Your final score is \(score) out of \(attempts) attempts."
                    score = 0
                    attempts = 0
                } else {
                    alertTitle = "You Win! 😆"
                    alertMessage = "Your score is \(score) out of \(attempts) attempts."
                }
            } else {
                score -= 1
                attempts += 1
                if (attempts == 10) {
                    alertTitle = "Game Over! 🤯"
                    alertMessage = "Your final score is \(score) out of \(attempts) attempts."
                    score = 0
                    attempts = 0
                } else {
                    alertTitle = "You Lose! 😥"
                    alertMessage = "Your score is \(score) out of \(attempts) attempts."
                }
            }
        } else {
            if (!checkWin(butName, moves[compChoice])) {
                score += 1
                attempts += 1
                if (attempts == 10) {
                    alertTitle = "Game Over! 🤯"
                    alertMessage = "Your final score is \(score) out of \(attempts) attempts."
                    score = 0
                    attempts = 0
                } else {
                    alertTitle = "You Win! 😆"
                    alertMessage = "Your score is \(score) out of \(attempts) attempts."
                }
            } else {
                score -= 1
                attempts += 1
                if (attempts == 10) {
                    alertTitle = "Game Over! 🤯"
                    alertMessage = "Your final score is \(score) out of \(attempts) attempts."
                    score = 0
                    attempts = 0
                } else {
                    alertTitle = "You Lose! 😥"
                    alertMessage = "Your score is \(score) out of \(attempts) attempts."
                }
            }
        }
        
        showAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
