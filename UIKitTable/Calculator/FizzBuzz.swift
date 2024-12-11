/*
 Problem Statement :
 
 1. Input any number and for multiples of 3 print “Fizz” instead of the number and for the multiples of 5 print “Buzz“. For numbers which are multiples of both 3 and 5 print “FizzBuzz”.
 */

import Foundation

struct FizzBuzz {
    func isMultipleOfThreeOrFive(number:Int) -> String {
        if (number % 3 == 0 && number % 5 == 0) {
            "FizzBuzz"
        }
        else if (number % 3 == 0) {
            "Fizz"
        }
        else if (number % 5 == 0) {
            "Buzz"
        }
        else {
            "\(number)"
        }
    }
}
