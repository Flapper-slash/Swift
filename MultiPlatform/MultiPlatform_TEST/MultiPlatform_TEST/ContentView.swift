//
//  ContentView.swift
//  MultiPlatform_TEST
//
//  Created by 이희웅 on 2023/06/08.
//

import SwiftUI

// os별 전처리 기본 형태
#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#else
// 현재는 tvOS, watchOS 까지 총 네개이며 PreviewPlatform enum 으로 정의되어 있다.
// TARGET_OS_IOS 와 같은 형태의 definition objective_c 에서 활용되는 것들이다.
#endif

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        #if os(iOS)
        ContentView().previewDevice(
            PreviewDevice(
                rawValue: "iPad Pro (12.9-inch) (6th generation)"))
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
//        #elseif os(tvOS)
//        ContentView().previewDevice(
//            PreviewDevice(
//                rawValue: "Apple TV 4K (3rd generation) (at 1080p)"))
        #endif
    }
}
