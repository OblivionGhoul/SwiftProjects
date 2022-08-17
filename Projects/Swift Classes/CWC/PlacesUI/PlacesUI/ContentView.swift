//
//  ContentView.swift
//  PlacesUI
//
//  Created by Minh Dinh on 1/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                Image("toronto")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                
                VStack (alignment: .center) {
                    Text("CN Tower")
                        .padding([.top, .leading, .trailing])
                        .font(.largeTitle)
                    
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                        Text("Toronto").font(.caption)
                    }.padding([.leading, .bottom, .trailing])
                }
                .foregroundColor(Color.white)
                .background(Color.black)
                .cornerRadius(10)
                .opacity(0.8)
                
            }.padding()
            
            ZStack {
                Image("london")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                
                VStack (alignment: .center) {
                    Text("Big Ben")
                        .padding([.top, .leading, .trailing])
                        .font(.largeTitle)
                    
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                        Text("London").font(.caption)
                    }.padding([.leading, .bottom, .trailing])
                }
                .foregroundColor(Color.white)
                .background(Color.black)
                .cornerRadius(10)
                .opacity(0.8)
                
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
