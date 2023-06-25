//
//  ViewController.swift
//  ExImplicitSelfCapture
//
//  Created by 김종권 on 2023/06/25.
//

import UIKit

class ViewController: UIViewController {
    var mainTitle = "김종권의 iOS 앱 개발 알아가기"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            print(mainTitle) // OK
        }
        
        MyTask {
            print(mainTitle) // OK
        }
    }
}

class Person {
    var name = "jake"
    
    func myFunc1() {
        
    }
    
    func myFunc2(_: @escaping () -> Void) {
        myFunc2 {
            myFunc1()
            // error: Call to method 'myFunc1' in closure requires explicit use of 'self' to make capture semantics explicit
        }
    }
    
    func myFunc3(@_implicitSelfCapture _: @escaping () -> Void) {
        myFunc3 {
            myFunc1()
            // ok
        }
    }
}

func MyTask(@_implicitSelfCapture closure: @escaping () -> Void) {
    
}
