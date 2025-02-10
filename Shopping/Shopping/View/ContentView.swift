//
//  ContentView.swift
//  Shopping
//
//  Created by Enkhtsetseg Unurbayar on 2/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button {
                print("Button Pressed")
            } label: {
                Text("Test")
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
