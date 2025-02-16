//
//  VenmoViewController.swift
//  UIKitTable
//
//  Created by Siran Li on 1/9/25.
//

import UIKit

class VenmoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let observerOne = Observer(name: "Ob One")
        let observerTwo = Observer(name: "Ob Two")
        
        VenmoNotificationCenter.shared.add(observer: observerOne, selector: #selector(self.showSpinningWheel(_:)), name: NSNotification.Name(rawValue: "someNotification").rawValue)
        VenmoNotificationCenter.shared.add(observer: observerTwo, selector: #selector(self.showSpinningWheel(_:)), name: NSNotification.Name(rawValue: "someNotification").rawValue)
        
        let notification = Notification(name: Notification.Name("someNotification"))
        VenmoNotificationCenter.shared.post(notification: notification)
        
        VenmoNotificationCenter.shared.remove(observer: observerOne)
        VenmoNotificationCenter.shared.post(notification: notification)
        
    }
    
    @objc func showSpinningWheel(_ notification: Notification) {
        print("received: \(notification.name.rawValue)")
    }
}

class Observer {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func perform(selector: Selector) {
        print("observer \(name) perform selector: \(selector.description)")
    }
}

protocol MyNotificationCenterProtocol {
    func add(observer: AnyObject, selector: Selector, name: String)
    func post(notification: Notification)
    func remove(observer: AnyObject)
}

class VenmoNotificationCenter: MyNotificationCenterProtocol {
    @MainActor static let shared = VenmoNotificationCenter()
    
    private var observers: [String: [(observer: AnyObject, selector: Selector)]] = [:]
    private let queue = DispatchQueue(label: "com.mynotificationcenter.queue")
    
    func add(observer: AnyObject, selector: Selector, name: String) {
        queue.sync {
            self.observers[name, default: []].append((observer, selector))
        }
    }
    
    func post(notification: Notification) {
        let name = notification.name.rawValue
        queue.sync {
            guard let observerList = self.observers[name] else { return }
            for (observer, selector) in observerList {
                observer.perform(selector)
            }
        }
    }
    
    func remove(observer: AnyObject) {
        queue.sync {
            for (key, value) in self.observers {
                self.observers[key]?.removeAll(where: { $0.observer === observer })
            }
        }
    }
}
