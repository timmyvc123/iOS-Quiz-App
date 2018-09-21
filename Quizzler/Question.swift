//
//  Question.swift
//  Quizzler
//
//  Created by Timmy Van Cauwenberge on 7/12/18.
//  Copyright © 2018 Van Cowabunga Games. All rights reserved.
//

import Foundation

class Question {
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
    
    
}
