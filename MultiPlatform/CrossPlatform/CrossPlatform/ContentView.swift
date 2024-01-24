//
//  ContentView.swift
//  CrossPlatform
//
//  Created by Slash on 2023/07/11.
//

import SwiftUI
#if os(macOS)
@available(macOS 13.0, *)
struct ContentView: View {
    
    var body: some View {
        NavigationSplitView(sidebar: {
            List(1..<51) {
                 Text("\($0)")
            }
            .listStyle(.sidebar)
        }, detail: {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
        })
    }
}

#elseif os(iOS)
struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            List(1..<51) {
                 Text("\($0)")
            }
            .listStyle(.sidebar)
        }
    }
}
#endif

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        #if os(iOS)
        ContentView().previewDevice(
            PreviewDevice(
                rawValue: "iPhone 14 Pro"))
        #elseif os(macOS)
        ContentView().previewDevice(
            PreviewDevice(
                rawValue: "Mac"))
//        #elseif os(watchOS)
//        ContentView().previewDevice(
//            PreviewDevice(
//                rawValue: "Apple Watch Series 8 (45mm)"))
        #endif
    }
}
