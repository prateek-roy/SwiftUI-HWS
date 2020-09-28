//
//  ContentView.swift
//  SwiftUI-HWS
//
//  Created by Prateek Roy on 25/09/20.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Basics")) {
                    Text("We Split")
                }
            }
            .navigationTitle("Swift UI Examples")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
