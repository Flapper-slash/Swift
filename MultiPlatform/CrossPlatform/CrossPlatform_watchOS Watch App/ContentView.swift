//
//  ContentView.swift
//  CrossPlatform_watchOS Watch App
//
//  Created by Slash on 2023/07/11.
//

import SwiftUI

@available(watchOS 6.0, *)
struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            List(1..<51) {
                 Text("\($0)")
            }
            .listStyle(.carousel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
