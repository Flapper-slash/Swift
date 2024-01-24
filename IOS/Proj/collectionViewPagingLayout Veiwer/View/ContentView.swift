//
//  ContentView.swift
//  collectionViewPagingLayout Veiwer
//
//  Created by 이희웅 on 2023/05/30.
//

import SwiftUI

struct ContentView: View {
    @State var presentSliderView = true
    @State var presentOptions = false
    @State var expandableTabbarSelectedNumber : Int = 0
    
    @State var presentLayoutOption : Bool = false
    
    var body: some View {
        ZStack{
            VStack{
                NavigationView{
                    switch(expandableTabbarSelectedNumber){
                    case 0:
                        Canvas { context, size in
                            
                        }
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            
                            // HERE Action about canvas click
                            debugPrint("캔버스 클릭")
                            
                        }
                        .border(.blue, width: 1)
                        .navigationTitle("Navigation Title")
                        .toolbar {
                            Button(action: {}) {
                                Image(systemName: "gearshape")
                            }
                        }
                    case 1:
                        VStack{
                            LayoutSelectionView()
                        }
                    case 2:
                        VStack{
                            
                        }
                    case 3:
                        VStack{
                            
                        }
                    default:
                        VStack{
                            let a = print("네비게이션 바 디폴트 셀렉션 발생")
                        }
                    }
                }
            }
            ExpandableTabbar(selected: self.$expandableTabbarSelectedNumber)
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
