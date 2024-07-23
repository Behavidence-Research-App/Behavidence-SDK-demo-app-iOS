//
//  ContentView.swift
//  Behavidence-SDK-demo-app-iOS
//
//  Created by Ela Kliots Shapira on 23/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("behavidence_logo_vertical")
                .imageScale(.large)
            
            Text("Behavidence SDK")
                .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
