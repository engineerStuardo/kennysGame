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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hideAllImages()
        initializeTimer()
        enabledUserInteraction()
        addingGestureRecognizer()
        
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
        imageViewOne.isUserInteractionEnabled = true
        imageViewTwo.isUserInteractionEnabled = true
        imageViewThree.isUserInteractionEnabled = true
        imageViewFour.isUserInteractionEnabled = true
        imageViewFive.isUserInteractionEnabled = true
        imageViewSix.isUserInteractionEnabled = true
        imageViewSeven.isUserInteractionEnabled = true
        imageViewEight.isUserInteractionEnabled = true
        imageViewNine.isUserInteractionEnabled = true
    }
    
    func initializeTimer() {
        counter = 10
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }
    
    @objc func timerFunction() {
        hideAllImages()
        counterLabel.text = "\(counter)"
        counter -= 1
        showRandomKenny()
        
        if counter == 0 {
            hideAllImages()
            counterLabel.text = "0"
            timer.invalidate()
            
            let alert = UIAlertController(title: "Time's Up", message: "Do you want to play again?", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .default)
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
        let randomImg = Int.random(in: 1..<10)
        
        if randomImg == 1 {
            imageViewOne.isHidden = false
        } else if randomImg == 2 {
            imageViewTwo.isHidden = false
        } else if randomImg == 3 {
            imageViewThree.isHidden = false
        } else if randomImg == 4 {
            imageViewFour.isHidden = false
        } else if randomImg == 5 {
            imageViewFive.isHidden = false
        } else if randomImg == 6 {
            imageViewSix.isHidden = false
        } else if randomImg == 7 {
            imageViewSeven.isHidden = false
        } else if randomImg == 8 {
            imageViewEight.isHidden = false
        } else {
            imageViewNine.isHidden = false
        }
    }

    func hideAllImages() {
        imageViewOne.isHidden = true
        imageViewTwo.isHidden = true
        imageViewThree.isHidden = true
        imageViewFour.isHidden = true
        imageViewFive.isHidden = true
        imageViewSix.isHidden = true
        imageViewSeven.isHidden = true
        imageViewEight.isHidden = true
        imageViewNine.isHidden = true
    }

}

