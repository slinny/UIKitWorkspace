import Foundation

struct Calculator {
    
    func add<T: Numeric>(num1: T, num2: T) -> T {
        return num1 + num2
    }
    
    func sum(_ num1: Int, _ num2: Int) -> Int {
        num1 + num2
    }
    
    func multiply(_ num1: Int, _ num2: Int) -> Int {
        num1 * num2
    }
    
    
}
