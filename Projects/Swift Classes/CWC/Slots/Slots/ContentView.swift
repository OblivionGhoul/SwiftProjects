//
//  ContentView.swift
//  Slots
//
//  Created by Minh Dinh on 1/12/22.
//

import SwiftUI

struct ContentView: View {
    private let fruits = ["apple", "cherry", "star"]
    @State private var credits = 1000
    @State private var message = "Your Credits: "
    @State private var slot1 = "apple"
    @State private var slot2 = "apple"
    @State private var slot3 = "apple"
    
    var body: some View {
        VStack {
            Text("Slots!").font(.largeTitle).multilineTextAlignment(.center).padding(.top, 20)
            Spacer()
            Text(message + String(credits)).font(.title2).multilineTextAlignment(.center).padding()
            Spacer()
            HStack {
                Spacer()
                Image(slot1)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Image(slot2)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Image(slot3)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
            Spacer()
            Button("Spin", action: {spin()})
                .foregroundColor(Color.white)
                .padding()
                .padding(.horizontal, 30.0)
                .background(Color.pink)
                .cornerRadius(30)
            Spacer()
        }
    }
    
    func getFruit() -> String {
        let index = Int.random(in: 0...2)
        return fruits[index]
    }
    
    func spin() {
        if credits == 1000 {
            message = "Your Credits: "
        }
        
        slot1 = getFruit()
        slot2 = getFruit()
        slot3 = getFruit()
        
        if slot1 == slot2 && slot2 == slot3 {
            credits += 100
        } else {
            credits -= 50
            
            if credits <= 0 {
                message = "No More Credits, Restarting Game! Your Credits: "
                credits = 1000
            }
        }
    }
}

struct newView: View {
    var body: some View {
        Text("Idk")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
