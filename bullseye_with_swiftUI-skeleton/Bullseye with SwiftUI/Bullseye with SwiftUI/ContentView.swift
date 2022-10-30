//
//  ContentView.swift
//  Bullseye with SwiftUI
//
//  Created by Tony Hong on 2/17/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack() {
            Text("High Score")
            Text("0")
                .padding()
        }
        
        Spacer()
        
        VStack() {
            Text("Current level")
            Text("1")
                .padding()
        }
    }
    Spacer()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
