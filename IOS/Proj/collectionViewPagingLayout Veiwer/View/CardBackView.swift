//
//  CardBackView.swift
//  collectionViewPagingLayout Veiwer
//
//  Created by 이희웅 on 2023/06/08.
//

import SwiftUI

struct CardBackViewDegree{
    @State static var value : Double = 0
}

struct CardBackView : View {
    let width : CGFloat
    let height : CGFloat
    @Binding var degree : Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.blue.opacity(0.7), lineWidth: 3)
                .frame(width: width, height: height)

            Image("cardBack_Basic")
                .resizable()
                .frame(width: width, height: height)
                .foregroundColor(.blue.opacity(0.7))
            
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct CardBackView_Previews: PreviewProvider {
    static var width:CGFloat = 0
    static var height:CGFloat = 0
    
    static var previews: some View {

        let screenBounds = UIScreen.main.bounds
        let screenScale = UIScreen.main.scale
        let screenSize = CGSize(width: screenBounds.size.width * screenScale, height: screenBounds.size.height * screenScale)

        CardBackView(
            width: (screenSize.height) / 15,
            height: (screenSize.height) / 10,
            degree: CardBackViewDegree.$value
        ).previewDevice(
            PreviewDevice(
                rawValue: "iPad Pro (12.9-inch) (6th generation)"))
        .onAppear{
            debugPrint(screenBounds, screenScale, screenSize)
        }

        CardBackView(
            width: (screenSize.height) / 15,
            height: (screenSize.height) / 10,
            degree: CardBackViewDegree.$value
        ).previewDevice(
            PreviewDevice(
                rawValue: "iPhone 14 Pro"))
    }
}
