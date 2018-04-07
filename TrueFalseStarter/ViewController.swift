//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    @IBOutlet weak var fourthAnswerButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
   
    var questionProvider = QuestionProvider() //Loading array of questions and initiatin random function
    //var checkAnswers = CheckAnswer()
    //var scoreForThisGame = Answer()

    var finalAnswer: Int = 0
    var correctQuestions: Int = 0
    
    //Dette skal fikses senere
    var questionsAsked: Int = 0
    var questionsPerRound: Int = 4
    

    override func viewDidLoad() {
        super.viewDidLoad()
        finalAnswer = questionProvider.randomQuestion(label: questionField, button1: firstAnswerButton, button2: secondAnswerButton, button3: thirdAnswerButton, button4: fourthAnswerButton, button5: playAgainButton)
        
        }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        
        questionsAsked += 1
        
        if (sender === firstAnswerButton &&  finalAnswer == 1) ||
            (sender === secondAnswerButton && finalAnswer == 2) ||
            (sender === thirdAnswerButton &&  finalAnswer == 3) ||
            (sender === fourthAnswerButton &&  finalAnswer == 4)
        {
            correctQuestions += 1
            questionField.text = "Correct!"
        } else {
            questionField.text = "Sorry, wrong answer!"
        }
        
        loadNextRoundWithDelay(seconds: 1)
    }
    
    
    func displayScore() {
        // Hide the answer buttons
        firstAnswerButton.isHidden = true
        secondAnswerButton.isHidden = true
        thirdAnswerButton.isHidden = true
        fourthAnswerButton.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }

    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
            questionProvider = QuestionProvider()
        } else {
            // Continue game
            finalAnswer = questionProvider.randomQuestion(label: questionField, button1: firstAnswerButton, button2: secondAnswerButton, button3: thirdAnswerButton, button4: fourthAnswerButton, button5: playAgainButton)
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        firstAnswerButton.isHidden = false
        secondAnswerButton.isHidden = false
        thirdAnswerButton.isHidden = false
        fourthAnswerButton.isHidden = false
        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    
    
    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }

}
