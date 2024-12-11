//
//  CGContainsViewController.swift
//  UIKitTable
//
//  Created by Siran Li on 12/11/24.
//

import UIKit

class CGContainsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rect1 = CGRect(x: 100, y: 100, width: 100, height: 100)
        let rect2 = CGRect(x: 120, y: 120, width: 50, height: 50)
        
        if CGRectContainsRect(rect1, rect2) {
            print("Rect1 contains Rect2")
        } else {
            print("Rect1 does not contain Rect2")
        }
        
        print(rect1.contains(rect2)) // true
        print(rect2.contains(rect1)) // false
        
        let view1 = UIView(frame: rect1)
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.backgroundColor = .blue
        
        let view2 = UIView(frame: rect2)
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.backgroundColor = .red
        
        
        view.addSubview(view1)
        view.addSubview(view2)
    }
}

extension CGRect {
    func contains(_ rect: CGRect) -> Bool {
        return minX <= rect.minX &&
               minY <= rect.minY &&
               maxX >= rect.maxX &&
               maxY >= rect.maxY
    }
}

#Preview {
    CGContainsViewController()
}


