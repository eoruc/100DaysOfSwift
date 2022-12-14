//
//  ViewController.swift
//  02-Project2
//
//  Created by eoruc on 17.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem =  UIBarButtonItem(title: "Score",
                                                             style: .plain,
                                                             target: self,
                                                             action: #selector(scoreTapped))
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        // Do any additional setup after loading the view.
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        questionCounter += 1;
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased() + "   Score: " + String(score)

    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String

        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
            let ac = UIAlertController(title: title, message: "Wrong answer! Answer: \(countries[correctAnswer].uppercased()).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
            present(ac, animated: true)
        }
        
        if(questionCounter < 10){
            askQuestion()
        }
        else{
            questionCounter = 0
            let ac = UIAlertController(title: title, message: "Your final score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
    }
    @objc func scoreTapped() {
        let ac = UIAlertController(title: "Current Score", message: "Your score is \(score)", preferredStyle: .alert)
                
        ac.addAction(UIAlertAction(title: "Continiue", style: .default, handler: nil))
                
        present(ac, animated: true)
    }
}

