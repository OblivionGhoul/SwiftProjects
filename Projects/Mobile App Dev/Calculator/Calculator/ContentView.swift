//
//  ContentView.swift
//  Calculator
//
//  Created by Minh Dinh on 2/10/22.
//

import SwiftUI

struct ContentView: View {
    let calcs = ["Volume Calculator", "Percent Error Calculator"]
    @State private var calcSelector = "Volume Calculator"
    
    @State private var length:Double?
    @State private var width:Double?
    @State private var height:Double?
    @State private var volume = 0.0
    
    @State private var answer = 0.0
    @State private var experimental:Double?
    @State private var theoretical:Double?
    
    var body: some View {
        VStack {
            
            Picker("Which Calcutor Do You Want To Use?", selection: $calcSelector) {
                ForEach(calcs, id: \.self) {
                    Text($0)
                }
            }
            
            if (calcSelector == "Volume Calculator") {
                Form {
                    Section {
                        Text("Your Volume: \(volume)")
                    }
                    
                    Section {
                        TextField("Length" , value: $length, format: .number)
                        TextField("Width" , value: $width, format: .number)
                        TextField("Height" , value: $height, format: .number)
                    }
                    
                    Section {
                        if (length != nil && width != nil && height != nil) {
                            Button("Calculate!") {
                                volume = length! * width! * height!
                            }
                        }
                    }
                }
            } else if (calcSelector == "Percent Error Calculator") {
                Form {
                    Section {
                        Text("Percent Error: \(answer)%")
                    }
    
                    Section {
                        TextField("Experimental Value" , value: $experimental, format: .number)
                        TextField("Theoretical Value", value: $theoretical, format: .number)
                    }
    
                    Section {
                        if (experimental != nil && theoretical != nil) {
                            Button("Calculate!") {
                                answer = (abs(experimental! - theoretical!) / abs(theoretical!)) * 100
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
