//
//  ContentView.swift
//  Text_Hover_Ex
//
//  Created by 이희웅 on 2023/06/03.
//

import SwiftUI

struct ContentView: View {
    @State private var isHovered = false
    
    var body: some View {
        Text("Edit")
        .padding()
        .onTapGesture {
            // some action
        }
        .background(isHovered ? Color.pink : Color.clear)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 10,
                style: .continuous
            )
        )
        .onHover { isHovered in
            withAnimation {
                self.isHovered = isHovered
            }
        }
    }
}
    