//
//  Question.swift
//  UIKitWorkspace
//
//  Created by Siran Li on 12/15/24.
//


import Foundation

struct Question: Identifiable {
    let id: Int
    let question: String
    let correctAnswer: String
    let wrongAnswer: String
}
