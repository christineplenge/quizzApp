//
//  QuestionProvider.swift
//  TrueFalseStarter
//
//  Created by Christine Plenge on 27/07/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import GameKit

public struct QuestionProvider {
    
    let listOfQuestions = [
        QuestionType(question: "This was the only US President to serve more than two consecutive terms.", firstAnswer: "George Washington", secondAnswer: "Franklin D. Roosevelt", thirdAnswer: "Woodrow Wilson", fourthAnswer: "Andrew Jackson", correctAnswer: 2),
        QuestionType(question: "Which of the following countries has the most residents?", firstAnswer: "Nigeria", secondAnswer: "Russia", thirdAnswer: "Iran", fourthAnswer: "Vietnam", correctAnswer: 1),
        QuestionType(question: "In what year was the United Nations founded?", firstAnswer: "1918", secondAnswer: "1919", thirdAnswer: "1945", fourthAnswer: "1954", correctAnswer: 3),
        QuestionType(question: "Hvor gammel er Peter?", firstAnswer: "46", secondAnswer: "47", thirdAnswer: "48", fourthAnswer: "49", correctAnswer: 1)
    ]
    
    
    mutating func randomQuestion(label: UILabel, button1: UIButton, button2: UIButton, button3: UIButton, button4: UIButton, button5: UIButton) -> Int {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: listOfQuestions.count)
        label.text = listOfQuestions[randomNumber].question
        button1.setTitle(listOfQuestions[randomNumber].firstAnswer, for: [])
        button2.setTitle(listOfQuestions[randomNumber].secondAnswer, for: [])
        button3.setTitle(listOfQuestions[randomNumber].thirdAnswer, for: [])
        button4.setTitle(listOfQuestions[randomNumber].fourthAnswer, for: [])
        button5.isHidden = true
        return listOfQuestions[randomNumber].correctAnswer
        
    }
    
}

