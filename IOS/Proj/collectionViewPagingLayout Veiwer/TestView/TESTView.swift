//
//  TESTView.swift
//  collectionViewPagingLayout Veiwer
//
//  Created by 이희웅 on 2023/06/08.
//

import SwiftUI
import CollectionViewPagingLayout

var cardBack : CardBack = CardBack.BASIC

struct TESTView: View {

    @Binding var isPresented : Bool
    
    //MARK: Variables
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var isFlipped = false
    
    var width : CGFloat = 200
    var height : CGFloat = 250
    let durationAndDelay : CGFloat = 0.3
    
    //MARK: Flip Card Function
    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }
    func ActionSelectCard() -> Bool{
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
            return true
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
            return false
        }
    }
    
    struct Item: Identifiable {
        let id : UUID = .init()
        let number : Int
    }
    let items = Array(0..<5).map {
        Item(number: $0)
    }
    
    var options:ScaleTransformViewOptions {
        .layout(.rotary)
    }
    
    
    @State var draggedOffset = CGSize.zero
    @State var accumulatedOffset = CGSize.zero
    
    var body: some View {
        
        Button("dismiss") { self.isPresented = false }
        
        ScalePageView(items) { item in
            ZStack {
                //@State 변수를 View 내부의 다른 View에 전달하고자 한다면, $를 이용하여 전달합니다. 예를 들어, @State Private var isFaceUp: Bool = false를 CardView에 전달하고자 한다면, CardView(isFaceUp: $isFaceUp)의 형태로 전달해야합니다. (그리고 이를 @Binding으로 받습니다)
                CardFrontView(width: width, height: height, degree: $frontDegree)
                CardBackView(width: width, height: height, degree: $backDegree)
                }.onTapGesture {
                    flipCard ()
            }
            .offset(draggedOffset)
//            .gesture(drag)
        }
        .options(options)

        //the padding around each page
        // you can use '.fractionalwidth' and
        // '.fractionalHeight' too
        .pagePadding(vertical: .absolute(100), horizontal: .absolute(80))
        
        
//        ZStack {
//            CardFrontView(width: width, height: height, degree: $frontDegree)
//            CardBackView(width: width, height: height, degree: $backDegree)
//        }.onTapGesture {
//            flipCard ()
//        }
//        .offset(draggedOffset)
//        .gesture(drag)
    }
//
    var drag: some Gesture {
        DragGesture()
            .onChanged { gesture in
                draggedOffset = accumulatedOffset + gesture.translation
            }
            .onEnded { gesture in
                accumulatedOffset = accumulatedOffset + gesture.translation
            }
    }
}

//extension CGSize {
//  static func + (lhs: Self, rhs: Self) -> Self {
//    CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
//  }
//}
    
    
//        }.onTapGesture {
//            flipCard ()
//        }
        

struct TESTView_Previews: PreviewProvider {
    @State static var forPreview : Bool = true
    static var previews: some View {
        TESTView(isPresented: $forPreview)
    }
}
