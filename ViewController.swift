//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
     var pickedAnswer:Bool=false
    var questionNumber:Int=0
    var score:Int=0
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       updateUI()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if(sender.tag == 1){
            pickedAnswer=true
        }
        else if (sender.tag == 2){
            pickedAnswer=false
        }
        checkAnswer()
        nextQuestion()
        updateUI()
      }
    
    
    func updateUI() {
       
      questionLabel.text=QuestionsBank().list[questionNumber].questionText
        scoreLabel.text="Score: \(score)"
        progressLabel.text="\(questionNumber+1)/ \(QuestionsBank().list.count)"
        progressBar.frame.size.width=((view.frame.size.width)/CGFloat(QuestionsBank().list.count)) * CGFloat(questionNumber+1)
    }
    

    func nextQuestion() {
        questionNumber+=1
        if(questionNumber == (QuestionsBank().list.count)-1){
            let alert = UIAlertController(title: "Alert", message: "you have finished , do you want to restart?", preferredStyle:.alert)
            alert.addAction(UIAlertAction(title: "Restart", style: .default,handler:{
                (action) in self.startOver()
            }))
            alert.addAction(UIAlertAction(title: "cancel", style: .cancel,handler:{
                (action) in exit(0)
            }))
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) { // change 2 to desired number of seconds
                // Your code with delay
                   self.present(alert, animated: true, completion: nil)            }
         
            
        }
        
    }
    
    
    func checkAnswer() {
        if(pickedAnswer==QuestionsBank().list[questionNumber].answer){
            ProgressHUD.showSuccess("true")
            score+=1
        }
        else{
        ProgressHUD.showError("false!")
        }
      
    }
    
    
    func startOver() {
      questionNumber=0
        score=0
        updateUI()
    }
    

    
}
