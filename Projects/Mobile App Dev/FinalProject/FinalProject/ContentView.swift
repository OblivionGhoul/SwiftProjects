//
//  ContentView.swift
//  FinalProject
//
//  Created by Minh Dinh on 5/10/22.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(LinearGradient(colors: [.blue, .green], startPoint: .leading, endPoint: .topTrailing))
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.3 : 1)
            .animation(.easeOut(duration: 0.3), value: configuration.isPressed)
    }
}

struct ContentView: View {
    private var questions = [
        "Do you like meat?",
        "Do you want a lot of flavor?",
        "Do you want sweet food?",
        ""
    ]
    
    @State private var meat = false;
    @State private var flavor = false;
    @State private var sweet = false;
    @State private var questionIndex = 0;
    @State private var resultAlert = false;
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(colors: [.yellow, .orange, .red], startPoint: .leading, endPoint: .topTrailing)
                )
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Food Recommender")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                    .multilineTextAlignment(.center)
                
                Text(questions[questionIndex])
                    .font(.largeTitle)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                
                HStack {
                    Button("Yes") {
                        ifContinue()
                        updateAnswer()
                    }
                    Button("No") {
                        ifContinue()
                    }
                }.buttonStyle(GrowingButton())
                
                Spacer()
            }
        }
        .alert("Your Food Recommendation", isPresented: $resultAlert) {
            Text("Result: ")
            Button("OK", role: .cancel) {
                meat = false;
                flavor = false;
                sweet = false;
                questionIndex = 0;
                resultAlert = false;
            }
        } message: {
            Text("Result: " + result())
        }
    }
    
    func ifContinue() {
        if (questionIndex < 2) {
            questionIndex += 1;
        } else {
            resultAlert = true;
        }
    }
    
    func updateAnswer() {
        if (questionIndex == 0) { meat = true }
        else if (questionIndex == 1) { flavor = true }
        else if (questionIndex == 2) { sweet = true }
    }
    
    func result() -> String {
        if (meat) {
            return "In-N-Out Burger"
        } else if (flavor) {
            return "Chick-fil-A";
        } else if (sweet) {
            return "Yogurtland";
        } else if (!meat) {
            return "Panera Bread";
        } else if (!flavor) {
            return "KFC";
        } else if (!sweet) {
            return "Subway";
        } else {
            return "McDonalds";
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
