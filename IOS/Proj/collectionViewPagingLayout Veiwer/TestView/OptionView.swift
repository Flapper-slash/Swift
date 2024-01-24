//
//  OptionView.swift
//  collectionViewPagingLayout Veiwer
//
//  Created by 이희웅 on 2023/07/01.
//

import SwiftUI

struct OptionView: View {
    var body: some View {
        SliderView()
    }
}


struct SliderView: View {
    @State var sliderValue1: Double = 50
    @State var sliderValue2: Double = 50
    @State var color: Color = .red
    
    var minimumValueLable: Double = 0.0
    var maximumValueLable: Double = 100
    
    var body: some View {
        VStack {
            Text("슬라이더")
                .font(.title)
                .padding(.bottom, 100)
            
            HStack {
                Text("현재 슬라이더의 값은")
                Text(
                    (String(format: "%.0f", sliderValue1))
                )
                Text("입니다.")
            }
            
            HStack {
                Text("\(Int(minimumValueLable))")
                Slider(value: $sliderValue1, in: 0...100, step: 10.0)
                Text("\(Int(maximumValueLable))")
            }
            
            Divider().padding(.vertical, 50)
            /*                                                         */
            
            
            Text("현재 슬라이더의 값은 \(sliderValue2, specifier: "%.0f") 입니다.")
                .foregroundColor(color)
            
            Slider(value: $sliderValue2,
                   in: 0...100, step: 1.0,
                   
                   //실행이 되면 구현될 액션
                   onEditingChanged: { (_) in
                color = .blue
            },
                   minimumValueLabel: Text("0"),
                   maximumValueLabel: Text("100")) {
                
                Text("some lable")
            }
                   .accentColor(.orange)
        }
        .padding()
    }
}


struct OptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionView()
    }
}
