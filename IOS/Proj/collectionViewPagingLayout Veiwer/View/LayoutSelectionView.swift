//
//  LayoutSelectionView.swift
//  collectionViewPagingLayout Veiwer
//
//  Created by 이희웅 on 2023/06/14.
//

import SwiftUI

struct LayoutSelectionView: View {
    @State private var layoutOptions : LayoutOptions
    @State private var presentLayoutOption : Bool = false
    @State private var orientation = UIDeviceOrientation.unknown
    @State private var colors: [Color] = [.red, .green, .yellow, .black, .gray, .blue, .brown, .purple, .orange]
    
    init(){
        // 생성자에서 디폴트 레이아웃 옵션 생성
        self.layoutOptions = LayoutOptions()
        // 유저 디폴트에 레이아웃 설정파일이 존재한다면 로드하여 레이아웃 옵션 생성
        
    }
    
    var body: some View {
        Group {
            if orientation.isPortrait {
                portraitView(colors: self.$colors, presentLayoutOption: self.$presentLayoutOption)
            } else if orientation.isLandscape {
                Text("Landscape")
            } else if orientation.isFlat {
                Text("Flat")
            } else {
                // 방향을 알수 없을 때는 기본 Portrait을 기본값으로 사용하도록 한다.
                portraitView(colors: self.$colors, presentLayoutOption: self.$presentLayoutOption)
            }
        }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}

struct portraitView : View{
    @Binding var colors: [Color]
    @Binding var presentLayoutOption : Bool
    
    var body: some View{
        TabView{
            ScrollView(showsIndicators: false) {
                LazyVStack(pinnedViews: .sectionHeaders) {
                    Section(header:layoutView()) {
                        if(self.presentLayoutOption){
                            VStack {
                                ForEach(colors, id: \.self) { color in
                                    CellItemView(color: color)
                                        .padding(.horizontal, 10)
                                }
                            }
                        }
                    }.frame(minHeight: 300)
                }
            }
        }
    }
}

struct layoutView: View{
    var body: some View{
        TabView{
            StackPageView_Sample()
                .tabItem{
                    Image(systemName: "home.fill")
                    Text(MENU_EXPANDABLETABBAR_STRING.OPT.rawValue)
                }
            //                    .scaledToFill()
                .frame(minWidth: 250, maxWidth: 300, minHeight: 400, maxHeight: 450)
                .border(.black)
            TransformPageView_Sample()
                .tabItem{
                    Image(systemName: "home.fill")
                    Text(MENU_EXPANDABLETABBAR_STRING.OPT.rawValue)
                }.frame(minWidth: 250, maxWidth: 300, minHeight: 400, maxHeight: 400)
                .border(.black)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .background(Color(red: 150, green: 150, blue: 150))
        .border(.yellow)
    
    }
}
            
//            }
//            VStack{
//                LayoutOptView(layoutOptions: $layoutOptions, presentLayoutOption: $presentLayoutOption)
////                    .border(.black)
//            }
////            .scaledToFill()
//            .scaledToFit()
//            .border(.red)
//
//            .frame(height: 200)
//            .clipped()
//
//            if (self.presentLayoutOption == true){
//                let l = debugPrint("top")
//                tv.frame(minWidth: 66, maxWidth: 330, minHeight: 90, maxHeight: 450)
//            }else{
//                let l = debugPrint("top")
//                tv.frame(minWidth: 66, maxWidth: 330, minHeight: 90, maxHeight: 450)
//            }
//        }
        
//        TabView{
//            let s1 = VStack(){
//                StackPageView_Sample()
//                    .border(.black)
//                optButtonView(layoutOptions: $layoutOptions, presentLayoutOption: $presentLayoutOption)
//                    .border(.black)
//            }.tabItem{
//                Image(systemName: "home.fill")
//                Text(MENU_EXPANDABLETABBAR_STRING.OPT.rawValue)
//            }.border(.red)
//            if (self.presentLayoutOption == true){
//                let l = debugPrint("top")
//                s1.position(y: -200)
//                s1.frame(minWidth: 66, maxWidth: 330, minHeight: 90, maxHeight: 450)
//            }else{
//                let l = debugPrint("top")
//                s1.frame(minWidth: 66, maxWidth: 330, minHeight: 90, maxHeight: 450)
//            }
//
//            VStack{
//                TransformPageView_Sample()
//                optButtonView(layoutOptions: $layoutOptions, presentLayoutOption: $presentLayoutOption)
//            }.tabItem{
//                Image(systemName: "home.fill")
//                Text(MENU_EXPANDABLETABBAR_STRING.OPT.rawValue)
//            }.frame(minWidth: 300, minHeight: 300, maxHeight: 400)
////            .padding()
//
//        }
//                .border(.black)
//                .onAppear() {
//                UITabBar.appearance().barTintColor = .black
//            }
//    }
//}

struct CellItemView: View {
    private var color: Color

    fileprivate init(color: Color) {
    self.color = color
    }

    var body: some View {
    RoundedRectangle(cornerRadius: 20)
    .foregroundColor(color)
    .frame(height: 100)
    }
}
            
struct LayoutOptView : View{
    @Binding var layoutOptions : LayoutOptions
    @Binding var presentLayoutOption : Bool
    
    var body: some View {
        Button {
            self.presentLayoutOption.toggle()
        } label: {
            Image(systemName: "doc.badge.gearshape")
            Text("옵션 설정")
        }
        .sheet(isPresented: $presentLayoutOption) {
            Text("sheet view")
                .onTapGesture {
                    self.presentLayoutOption.toggle()
                }.presentationDetents([.fraction(0.7)])
        }
    }
}

struct LayoutSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutSelectionView()
    }
}
