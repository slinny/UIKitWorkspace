//
//  ViewControllerEnum.swift
//  UIKitTable
//
//  Created by Siran Li on 6/5/24.
//
/*
 1. A group of variables of the same type. Type safe.
 2. Type is optional for enums
 */


import UIKit

enum College: CaseIterable {
    case studentName
    case collegaName
    case id
}

enum CollegeWithType: String {
    case studentName = "John Doe"
    case collegaName = "MDU"
    case id = "1"
}

enum CollegeFunc {
    case studentName
    case collegaName
    case id
    
    func description() -> String {
        switch self {
        case .collegaName:
            return "MDU"
        case .studentName:
            return "John Doe"
        case .id:
            return "123"
        }
    }
}

enum StudentWithPara {
    case studentName(String)
    case marks(String, String, String)
}

class ViewControllerEnum: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let collegeDetail = College.studentName
//        print(collegeDetail.hashValue)
        
//        print(CollegeFunc.collegaName)
        
//        withType()
//        withoutType()
        
        withFunArguments()
    }
    
    func withFunArguments() {
//        _ = StudentWithPara.studentName("John Doe")
        var stuMarks = StudentWithPara.marks("12", "23", "34")
        stuMarks = StudentWithPara.studentName("John Doe")
        
        switch stuMarks {
        case .studentName(let strName):
            print("student name: \(strName)")
        case .marks(let mk1, let mk2, let mk3):
            print("student marks: \(mk1), \(mk2), \(mk3)")
        }
    }
    
    func withType() {
        let collegeDetail = CollegeWithType.studentName.rawValue
        print(collegeDetail)
    }
    
    func withoutType() {
        let collegeDetail = College.allCases.randomElement()!
        
        switch collegeDetail {
        case .collegaName:
            print("MDU")
        case .studentName:
            print("John Doe")
        case .id:
            print("123")
        }
    }

}
