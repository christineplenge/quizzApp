//
//  CheckAnswer.swift
//  TrueFalseStarter
//
//  Created by Christine Plenge on 04/08/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import GameKit

struct CheckAnswer {
    
    func checkAnswer(button1: UIButton, button2: UIButton, button3: UIButton, button4: UIButton, answer: Int, replyText: UILabel, guess: Answer, sender: UIButton)  {
        
        var guess = guess
        guess.questionsAsked += 1
        //let sender = sender
        
        if (sender === button1 &&  answer == 1) ||
            (sender === button2 && answer == 2) ||
            (sender === button3 &&  answer == 3) ||
            (sender === button4 &&  answer == 4)
        {
            guess.correctAnswers += 1
            replyText.text = "Correct!"
        } else {
            replyText.text = "Sorry, wrong answer!"
        }
        
        
        //loadNextRoundWithDelay(seconds: 2)
    }

}


