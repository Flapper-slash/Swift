//
//  CardFrontView.swift
//  collectionViewPagingLayout Veiwer
//
//  Created by 이희웅 on 2023/06/08.
//

import SwiftUI

struct CardFrontViewDegree{
    @State static var value : Double = 0
}

struct CardFrontView : View {
    let width : CGFloat
    let height : CGFloat
    @Binding var degree : Double
        
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            
            Image(systemName: "suit.club.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.red)
            
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct CardFrontView_Previews: PreviewProvider {
    
    static var previews: some View {
        let screenBounds = UIScreen.main.bounds
        let screenScale = UIScreen.main.scale
        let screenSize = CGSize(width: screenBounds.size.width * screenScale, height: screenBounds.size.height * screenScale)

        CardFrontView(
            width: screenSize.width / 2,
            height: screenSize.height / 2,
            degree: CardFrontViewDegree.$value
        )
    }
}
