//
//  ViewController.swift
//  Quizzler
//
//  Created by Timmy Van Cauwenberge on 7/12/18.
//  Copyright © 2018 Van Cowabunga Games. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
            
        } else if sender.tag == 2 {
            pickedAnswer = false
            
        }
        checkAnswer()
        
        questionNumber = questionNumber + 1
        nextQuestion()    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) /13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
        
    }
    

    func nextQuestion() {
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            
            updateUI()
            
        } else {
                let alert = UIAlertController(title: "Awesome", message: "You've finsihed all the questins, would you like to start over?", preferredStyle: .alert)
            
                let restartAction = UIAlertAction(title: "Restart", style: .default)
                    { (alertAction) in
                    self.startOver()
        
            }
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
            
            }
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            
            ProgressHUD.showSuccess("Correct!")
            
            score += 1
        } else {
            ProgressHUD.showError("Wrong!")
        }
        

    }
    
    
    func startOver() {
        score = 0
        questionNumber = 0
        nextQuestion()
    }
}
