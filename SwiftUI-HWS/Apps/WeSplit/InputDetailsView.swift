//
//  InputDetailsView.swift
//  SwiftUI-HWS
//
//  Created by Prateek Roy on 25/09/20.
//

import SwiftUI

struct InputDetailsView: View {
    @State private var checkAmount = ""
    @State private var peopleSelectedIndex = 2
    @State private var tipPercentageIndex = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        
        let peopleCount = Double(peopleSelectedIndex + 2)
        let totalBill = Double(checkAmount) ?? 0.0
        let totalTip = Double(tipPercentages[tipPercentageIndex]) * totalBill / 100
        
        return (totalBill + totalTip) / peopleCount
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                }
                
                Section {
                    Picker("Number of People", selection: $peopleSelectedIndex) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much Tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentageIndex) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total Per Person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationTitle("We Split")
        }
    }
}

struct InputDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        InputDetailsView()
    }
}
