//
//  ContentView.swift
//  ConMesura
//
//  Created by Carlos Román Alcaide on 8/3/24.
//


import SwiftUI

struct ContentView: View {
    
    @State private var input = 0.0
    @State private var placeholderInputUnit = "C"
    @State private var placeholderOutputUnit = "K"
    @State private var outputUnit = 0.0
    let inputUnits = ["K", "F", "C"]
    let outputUnits = ["K", "F", "C"]
    
    var returnUnit: String {
        
        
//
//        switch inputUnits {
//        case ["K"]:
//            outputUnit = input * 1.3
//            print(outputUnit)
//        case ["F"]:
//            print("yay")
//        case ["C"]:
//            print("ajua")
//        default:
//            print("nope")
//        }
//
//
//        switch outputUnits {
//        case ["F"]:
//            outputUnit *= 1.3
//        default:
//            print("nope")
//        }
        
        return "Keep trying boyo"
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Unit", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                    HStack {
                        Picker("Select Input Unit", selection: $placeholderInputUnit) {
                            ForEach(inputUnits, id: \.self) {
                            Text("\($0)")}
                        }
                        Picker("Select Output Unit", selection: $placeholderOutputUnit) {
                            ForEach(outputUnits, id: \.self) {
                            Text("\($0)")}
                        }
                    }
                    Section {
                        Text(returnUnit)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
