//
//  Question.swift
//  Quizzler
//
//  Created by user137691 on 4/4/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation
class Question{
    var questionText:String
    var answer:Bool
    init(text:String,correctAnswer:Bool) {
        questionText=text
        answer=correctAnswer
    }
    
}
