//
//  SliderView_Sample.swift
//  collectionViewPagingLayout Veiwer
//
// 슬라이더 구성요소 및

//  Created by 이희웅 on 2023/06/08.
//

import SwiftUI

struct SliderView_Sample_present{
    @State static var presentModal:Bool = true
}

struct SliderView_Sample: View {
    @Binding var isPresented: Bool
    
    @State var sliderValue1: Double = 50
    @State var sliderValue2: Double = 50
    @State var color: Color = .red
    
    var minimumValueLable: Double = 0.0
    var maximumValueLable: Double = 100
    
    var body: some View {
        VStack {
            Button("dismiss") { self.isPresented = false }
            
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

struct SliderView_Sample_Previews: PreviewProvider {
    static var previews: some View {
        SliderView_Sample(isPresented: SliderView_Sample_present.$presentModal)
    }
}
