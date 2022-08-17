//
//  ContentView.swift
//  WarCards
//
//  Created by Minh Dinh on 1/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard = "card2"
    @State private var cpuCard = "card2"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    @State private var message = "Press Deal To Play"
    
    var body: some View {
        ZStack {
                    
            Image("background").ignoresSafeArea()
                    
            VStack {
                Group {
                    Spacer()
                    Spacer()
                    Image("logo")
                    Text(message)
                        .font(.title2)
                        .foregroundColor(Color.white)
                        .padding(.top, 5)
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button(action: {
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    
                    if playerRand > cpuRand {
                        playerScore += 1
                        message = "The Player Wins!"
                    }
                    else if cpuRand > playerRand {
                        cpuScore += 1
                        message = "The CPU Wins!"
                    } else {
                        message = "It's A Tie!"
                    }
                    
                }, label: {
                    Image("dealbutton")
                })
                
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
