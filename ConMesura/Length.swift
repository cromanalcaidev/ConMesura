//
//  Length.swift
//  ConMesura
//
//  Created by cromanalcaidev on 9/3/24.
//

import SwiftUI

struct Length: View {
    
    @State private var input = 0.0
    @State private var inputUnit = "m"
    @State private var outputUnit = "km"
    let inputLengthUnits = ["m", "km", "ft.", "yd.", "in"]
    let outputLengthUnits = ["m", "km", "ft.", "yd.", "in"]
    
    var returnValue: Double {
        var inputValue = 0.0
        var outputValue = 0.0
        
        switch inputUnit {
        case "m":
            inputValue = self.input
        case "km":
            inputValue = self.input * 1000
        case "ft.":
            inputValue = self.input / 3.281
        case "yd.":
            inputValue = self.input / 1.094
        case "in":
            inputValue = self.input / 39.37
        default:
            print("NaN")
        }
        
        switch outputUnit {
        case "m":
            outputValue = inputValue
        case "km":
            outputValue = inputValue / 1000
        case "ft.":
            outputValue = inputValue * 3.281
        case "yd.":
            outputValue = inputValue * 1.094
        case "in":
            outputValue = inputValue * 39.37
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
                        Picker("Select a unit", selection: $inputUnit) {
                            ForEach(inputLengthUnits, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        
                        Picker("Select a unit", selection: $outputUnit) {
                            ForEach(outputLengthUnits, id: \.self) {
                                Text("\($0)")
                            }
                        }
                    }
                    
                    Text("\(returnValue.formatted()) \(outputUnit)")
                }
            }
        }
    }
}

#Preview {
    Length()
}
