//
//  main.swift
//  Optional_Chaning
//
//  Created by 이희웅 on 2023/06/04.
//

import Foundation
import ConsolManager

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}





let john = Person()
// 이 시점에 john 인스턴스는 값이 nil 인 residence 프로퍼티(멤버변수)를 가짐.
// 아래와 같이 강제 언래핑을 할 경우 런타임 에러를 발생시킴

//let roomCount = john.residence!.numberOfRooms

ConsolPrinter.printStart(1)
// 옵셔널체이닝은 자바스크립트의 그것과 같으며, 값이 있는지 체이닝을 통해 비교를 해서 if 문을 줄일 수 있다.
// 아래와 같이 하나의 값을 가지는 경우에는 와닿지 않지만
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
ConsolPrinter.printEnd()

// 아래와 같은 복잡한 상황에서도
class Class1{
    var person : Person?
}
class Class2{
    var class1 : Class1?
}




ConsolPrinter.printStart(2)
//구문의 연결(chaining)을 통해 간단하게 벗겨낼수 있따.
let myClass = Class2()
if let roomCount2 = myClass.class1?.person?.residence{
    print("John's residence has \(roomCount2) room(s).")
}else{
    print("Unable to retrieve the number of rooms.")
}
ConsolPrinter.printEnd()
