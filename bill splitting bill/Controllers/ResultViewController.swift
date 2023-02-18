//
//  ResultViewController.swift
//  bill splitting bill
//
//  Created by Artur Imanbaev on 17.02.2023.
//

import UIKit

class ResultViewController: UIViewController {
    let viewTotal: UIView = {
        $0.backgroundColor = #colorLiteral(red: 0.7728547454, green: 0.9422442913, blue: 0.7721576095, alpha: 1)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    let moneyLabel: UILabel = {
        $0.font = .systemFont(ofSize: 40)
        $0.textColor = .green
        $0.text = ""
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    let totalLabel: UILabel = {
        $0.font = .systemFont(ofSize: 30)
        $0.textColor = .gray
        $0.text = "Total per person"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    let infoLabel: UILabel = {
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .gray
        $0.numberOfLines = 2
        $0.text = ""
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    let recalculateButton: UIButton = {
        $0.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        $0.setTitle("Recalculate", for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        recalculateButton.addTarget(self, action: #selector(backToVC), for: .touchUpInside)
    }
    @objc func backToVC(){
        self.navigationController?.popViewController(animated: true)
    }
    func countBill(_ percent: Float, _ amountOfPeople: Double, _ bill: String){
        let billPerPerson = (Float(bill)! * (1 + percent)) / Float(amountOfPeople)
        moneyLabel.text = String(format: "%.2f", billPerPerson)
        infoLabel.text = "Split between \(Int(amountOfPeople)) people, with \(Int(percent * 100))% tip."
    }
}

