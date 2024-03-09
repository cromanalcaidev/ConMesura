//
//  ContentView.swift
//  ConMesura
//
//  Created by cromanalcaidev on 8/3/24.
//


import SwiftUI

struct ContentView: View {
    
    @State private var input = 0.0
    @State private var placeholderInputUnit = "C"
    @State private var placeholderOutputUnit = "K"
    let inputUnits = ["K", "F", "C"]
    let outputUnits = ["K", "F", "C"]
    
    var returnUnit: Double {
        
        var inputValue = 0.0
        var outputValue = 0.0
        
        switch placeholderInputUnit {
        case "K":
            inputValue = self.input - 273.15
        case "C":
            inputValue = self.input
        case "F":
            inputValue = (input - 32) * (5/9)
        default:
            print("NaN")
        }
        
        switch placeholderOutputUnit {
        case "K":
            outputValue = inputValue + 273.15
        case "C":
            outputValue = inputValue
        case "F":
            outputValue = (inputValue * (9 / 5)) + 32
        default:
            print("NaN")
        }
        
        return outputValue
        
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
                        Text("\(returnUnit.formatted()) \(placeholderOutputUnit)")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
