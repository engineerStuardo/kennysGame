//
//  ViewController.swift
//  kennysGame
//
//  Created by Italo Stuardo on 20/3/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    @IBOutlet weak var imageViewOne: UIImageView!
    @IBOutlet weak var imageViewTwo: UIImageView!
    @IBOutlet weak var imageViewThree: UIImageView!
    @IBOutlet weak var imageViewFour: UIImageView!
    @IBOutlet weak var imageViewFive: UIImageView!
    @IBOutlet weak var imageViewSix: UIImageView!
    @IBOutlet weak var imageViewSeven: UIImageView!
    @IBOutlet weak var imageViewEight: UIImageView!
    @IBOutlet weak var imageViewNine: UIImageView!
    
    var counter = 0
    var timer = Timer()
    var score = 0
    var highScore = 0
    var kennyArray = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        kennyArray = [imageViewOne, imageViewTwo, imageViewThree, imageViewFour, imageViewFive, imageViewSix, imageViewSeven, imageViewEight, imageViewNine]
        
        hideAllImages()
        initializeTimer()
        enabledUserInteraction()
        addingGestureRecognizer()
        initialTasks()
    }
    
    func initialTasks() {
        scoreLabel.text = "Score: \(score)"
        highScore = UserDefaults.standard.integer(forKey: "Score")
        highscoreLabel.text = "Highscore: \(highScore)"
    }
    
    func addingGestureRecognizer() {
        let tapImageOne = UITapGestureRecognizer(target: self, action: #selector(scoreFunction))
        self.imageViewOne.addGestureRecognizer(tapImageOne)
        
        let tapImageTwo = UITapGestureRecognizer(target: self, action: #selector(scoreFunction))
        imageViewTwo.addGestureRecognizer(tapImageTwo)
        
        let tapImageThree = UITapGestureRecognizer(target: self, action: #selector(scoreFunction))
        imageViewThree.addGestureRecognizer(tapImageThree)
        
        let tapImageFour = UITapGestureRecognizer(target: self, action: #selector(scoreFunction))
        imageViewFour.addGestureRecognizer(tapImageFour)
        
        let tapImageFive = UITapGestureRecognizer(target: self, action: #selector(scoreFunction))
        imageViewFive.addGestureRecognizer(tapImageFive)
        
        let tapImageSix = UITapGestureRecognizer(target: self, action: #selector(scoreFunction))
        imageViewSix.addGestureRecognizer(tapImageSix)
        
        let tapImageSeven = UITapGestureRecognizer(target: self, action: #selector(scoreFunction))
        imageViewSeven.addGestureRecognizer(tapImageSeven)
        
        let tapImageEight = UITapGestureRecognizer(target: self, action: #selector(scoreFunction))
        imageViewEight.addGestureRecognizer(tapImageEight)
        
        let tapImageNine = UITapGestureRecognizer(target: self, action: #selector(scoreFunction))
        imageViewNine.addGestureRecognizer(tapImageNine)
    }
    
    @objc func scoreFunction() {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    func enabledUserInteraction() {
        for kenny in kennyArray {
            kenny.isUserInteractionEnabled = true
        }
    }
    
    func initializeTimer() {
        counter = 10
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }
    
    @objc func timerFunction() {
        hideAllImages()
        counter -= 1
        counterLabel.text = "\(counter)"
        showRandomKenny()
        
        if counter == 0 {
            hideAllImages()
            counterLabel.text = "0"
            timer.invalidate()
            
            let alert = UIAlertController(title: "Time's Up", message: "Do you want to play again?", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .cancel)
            let replayButton = UIAlertAction(title: "Replay", style: .default, handler: playAgain)
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true)
            
            if highScore < score {
                highscoreLabel.text = "Highscore: \(score)"
                UserDefaults.standard.set(score, forKey: "Score")
            }
        }
    }
    
    func playAgain(alert: UIAlertAction) {
        print("Play again")
        counter = 0
        score = 0
        scoreLabel.text = "Score: 0"
        counterLabel.text = "10"
        initializeTimer()
    }
    
    func showRandomKenny() {
        let randomIndexImg = Int.random(in: 0..<9)
        kennyArray[randomIndexImg].isHidden = false
    }

    func hideAllImages() {
        for kenny in kennyArray {
            kenny.isHidden = true
        }
    }

}

