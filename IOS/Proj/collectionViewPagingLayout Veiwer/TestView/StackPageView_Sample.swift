//
//  StackPageView_Sample.swift
//  collectionViewPagingLayout Veiwer
//
//  Created by 이희웅 on 2023/06/14.
//

import SwiftUI
import CollectionViewPagingLayout

struct StackPageView_Sample: View {
    
    struct Item: Identifiable {
        let id : UUID = .init()
        let number : Int
    }
    let items = Array(0..<5).map {
        Item(number: $0)
    }
    
    var body: some View {
        StackPageView(items) { item in
            // Build your view here
            ZStack {
                Rectangle().fill(Color.orange)
                Text("\(item.number)")
            }
        }
        .pagePadding(.absolute(50))
        .options(.init(
            scaleFactor: 0.12,
            maxStackSize: 4,
            popAngle: .pi / 10,
            popOffsetRatio: .init(width: -1.45, height: 0.3),
            stackPosition: .init(x: 1.5, y: 0)
        ))
    }
}

struct StackPageView_Sample_Previews: PreviewProvider {
    static var previews: some View {
        StackPageView_Sample()
    }
}
