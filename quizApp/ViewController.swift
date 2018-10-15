//
//  ViewController.swift
//  quizApp
//
//  Created by Sebastian Hette on 16.09.2016.
//  Copyright © 2016 Sebastian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let questions = ["(20 + 193) x 22 : 11 =", "Favorite color?", "Where was I born?"]
    let answers = [["462", "492", "213"], ["blue", "black", "green"], ["Tokyo", "New York", "Indonesia"]]
    
    //Variables
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var points = 0;
    
    //Label
    @IBOutlet weak var lbl: UILabel!
    
    //Button
    @IBAction func action(_ sender: AnyObject)
    {
        if (sender.tag == Int(rightAnswerPlacement))
        {
            print ("RIGHT!")
            points += 1
        }
        else
        {
            print ("WRONG!!!!!!")
        }
        
        if (currentQuestion != questions.count)
        {
            newQuestion()
        }
        else
        {
            performSegue(withIdentifier: "showScore", sender: self)
        }
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        newQuestion()
    }
    
    //Function that displays new question
    func newQuestion()
    {
        lbl.text = questions[currentQuestion]
        
        rightAnswerPlacement = arc4random_uniform(3)+1
        
        //Create a button
        var button:UIButton = UIButton()
        
        var x = 1
        
        for i in 1...3
        {
            //Create a button
            button = view.viewWithTag(i) as! UIButton
            
            if (i == Int(rightAnswerPlacement))
            {
                button.setTitle(answers[currentQuestion][0], for: .normal)
            }
            else
            {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x = 2
            }
        }
        currentQuestion += 1
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

