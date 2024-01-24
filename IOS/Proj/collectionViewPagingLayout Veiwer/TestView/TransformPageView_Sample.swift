//
//  TransformPageView_Sample.swift
//  collectionViewPagingLayout Veiwer
//
//  Created by 이희웅 on 2023/06/14.
//

import SwiftUI
import CollectionViewPagingLayout

struct TransformPageView_Sample: View {
    struct Item: Identifiable {
        let id : UUID = .init()
        let number : Int
    }
    let items = Array(0..<5).map {
        Item(number: $0)
    }
    
    var body: some View {
        TransformPageView(items) { item, progress in
            // Build your view here
            ZStack {
                Rectangle().fill(Color.orange)
                Text("\(item.number)")
            }
            // Apply transform here
            .transformEffect(.init(translationX: progress * 200, y: 0))
        }
        // The padding around each page
        // you can use `.fractionalWidth` and
        // `.fractionalHeight` too
        .pagePadding(
            vertical: .absolute(100),
            horizontal: .absolute(80)
        )
    }
}

struct TransformPageView_Sample_Previews: PreviewProvider {
    static var previews: some View {
        TransformPageView_Sample()
    }
}
