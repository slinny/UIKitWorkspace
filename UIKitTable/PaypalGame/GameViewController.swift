//
//  GameViewController.swift
//  UIKitTable
//
//  Created by Siran Li on 12/15/24.
//

import UIKit

class GameViewController: UIViewController {
    
    var viewModel = QuestionViewModel()
    
    private let questionView : UILabel = {
        let label = UILabel()
        label.text = "What is the capital of France?"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let answerButtonOne : UIButton = {
        let button = UIButton()
        button.setTitle("Paris", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        return button
    }()
    
    private let answerButtonTwo : UIButton = {
        let button = UIButton()
        button.setTitle("London", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        return button
    }()
    
    private let scoreView : UILabel = {
        let label = UILabel()
        label.text = "Score: "
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let playAgainButton : UIButton = {
        let button = UIButton()
        button.setTitle("Play Again", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(questionView)
        questionView.translatesAutoresizingMaskIntoConstraints = false
        questionView.text = viewModel.questions[viewModel.index].question
        questionView.isHidden = viewModel.index == 10
        
        view.addSubview(answerButtonOne)
        answerButtonOne.translatesAutoresizingMaskIntoConstraints = false
        answerButtonOne.setTitle(viewModel.questions[viewModel.index].correctAnswer, for: .normal)
        answerButtonOne.addTarget(self, action: #selector(answerButtonOneTapped), for: .touchUpInside)
        answerButtonOne.isHidden = viewModel.index == 10
        
        view.addSubview(answerButtonTwo)
        answerButtonTwo.translatesAutoresizingMaskIntoConstraints = false
        answerButtonTwo.setTitle(viewModel.questions[viewModel.index].wrongAnswer, for: .normal)
        answerButtonTwo.addTarget(self, action: #selector(answerButtonTwoTapped), for: .touchUpInside)
        answerButtonTwo.isHidden = viewModel.index == 10
        
        view.addSubview(scoreView)
        scoreView.translatesAutoresizingMaskIntoConstraints = false
        scoreView.text = "Score: \(viewModel.score)"
        
        view.addSubview(playAgainButton)
        playAgainButton.translatesAutoresizingMaskIntoConstraints = false
        playAgainButton.addTarget(self, action: #selector(playAgainButtonTapped) , for: .touchUpInside)
        playAgainButton.isHidden = viewModel.index != 10
        
        NSLayoutConstraint.activate([
            questionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            questionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            answerButtonOne.topAnchor.constraint(equalTo: questionView.bottomAnchor, constant: 50),
            answerButtonOne.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            answerButtonOne.widthAnchor.constraint(equalToConstant: 200),
            answerButtonOne.heightAnchor.constraint(equalToConstant: 50),
            
            answerButtonTwo.topAnchor.constraint(equalTo: answerButtonOne.bottomAnchor, constant: 50),
            answerButtonTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            answerButtonTwo.widthAnchor.constraint(equalToConstant: 200),
            answerButtonTwo.heightAnchor.constraint(equalToConstant: 50),
            
            scoreView.topAnchor.constraint(equalTo: answerButtonTwo.bottomAnchor, constant: 50),
            scoreView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            playAgainButton.topAnchor.constraint(equalTo: scoreView.bottomAnchor, constant: 50),
            playAgainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playAgainButton.widthAnchor.constraint(equalToConstant: 200),
            playAgainButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func answerButtonOneTapped() {
        viewModel.checkAnswer(answer: (answerButtonOne.titleLabel?.text!)!)
    }
    
    @objc func answerButtonTwoTapped() {
        viewModel.checkAnswer(answer: (answerButtonTwo.titleLabel?.text!)!)
    }
    
    @objc func playAgainButtonTapped() {
        viewModel.startNewGame()
    }
}

#Preview {
    GameViewController()
}
