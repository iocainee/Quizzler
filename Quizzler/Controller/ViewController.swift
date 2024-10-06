import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var firstAnswer: UIButton!
    @IBOutlet weak var secondAnswer: UIButton!
    @IBOutlet weak var thirdAnswer: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let result = quizBrain.checkAnswer(userAnswer)
        
        if result == true {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
  
        quizBrain.nextQuestion()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
            self?.updateUI()
        }
    }
    
    func updateUI() {
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestionText()
        firstAnswer.setTitle(quizBrain.getAnswerOptions()[0], for: .normal)
        secondAnswer.setTitle(quizBrain.getAnswerOptions()[1], for: .normal)
        thirdAnswer.setTitle(quizBrain.getAnswerOptions()[2], for: .normal)
        progressBar.progress = quizBrain.getProgress()
        firstAnswer.backgroundColor = .clear
        secondAnswer.backgroundColor = .clear
        thirdAnswer.backgroundColor = .clear
    }
}

