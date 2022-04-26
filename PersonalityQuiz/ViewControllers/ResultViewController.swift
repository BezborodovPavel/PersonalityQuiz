//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var discriptLabel: UILabel!
    
    var answers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        guard let favoriteAnimal = selectFavorite() else {return}
        updateUI(set: favoriteAnimal.rawValue, and: favoriteAnimal.definition)
    }
    
    private func selectFavorite() -> Animal?{
        let counts = answers.reduce(into: [:]) {count, answer in
            count[answer.animal, default: 0] += 1
        }
        let favoriteAnimal = counts.max{a, b in a.value < b.value}?.key
        return favoriteAnimal
    }
    
    private func updateUI(set title: Character, and descrition: String) {
        titleLabel.text = "Вы - \(title)"
        discriptLabel.text = descrition
    }
}
