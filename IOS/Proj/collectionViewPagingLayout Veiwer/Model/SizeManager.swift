//
//  SizeManager.swift
//  collectionViewPagingLayout Veiwer
//
//  Created by 이희웅 on 2023/06/08.
//
import UIKit

class SizeManage{
    static let screenBounds = UIScreen.main.bounds
    static let screenScale = UIScreen.main.scale
    static var screenSize = CGSize(width: screenBounds.size.width * screenScale, height: screenBounds.size.height * screenScale)
    
//    init(){
//        let screenBounds = UIScreen.main.bounds
//        let screenScale = UIScreen.main.scale
//        screenSize = CGSize(width: screenBounds.size.width * screenScale, height: screenBounds.size.height * screenScale)
//    }
}
