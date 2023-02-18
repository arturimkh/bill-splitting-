//
//  ViewController.swift
//  bill splitting bill
//
//  Created by Artur Imanbaev on 14.02.2023.
//

import UIKit

class ViewController: UIViewController {

    let stackMain: UIStackView = {
        $0.axis = .vertical
        $0.backgroundColor = #colorLiteral(red: 0.7728547454, green: 0.9422442913, blue: 0.7721576095, alpha: 1)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
        }(UIStackView())
    let stackPercent: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 20
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
        }(UIStackView())
    let billField: UITextField = {
        $0.textAlignment = .center
        $0.textColor = .green
        $0.placeholder = "e.g 125.34"
        $0.keyboardType = .phonePad
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())
    let enterLabel: UILabel = {
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .gray
        $0.text = "Enter bill total"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    let selectTipLabel: UILabel = {
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .gray
        $0.text = "Select tip"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    let splitLabel: UILabel = {
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .gray
        $0.text = "Choose split"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    let percents = [0,10,20]
    let calculateButton: UIButton = {
        $0.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        $0.setTitle("Calculate", for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    let stepper: UIStepper = {
        $0.minimumValue = 0
        $0.value = 1
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStepper())
    let stepLabel: UILabel = {
        $0.textColor = .green
        $0.text = "0"
        $0.font = .systemFont(ofSize: 40)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    let resultView = ResultViewController()
    var previousButton = 0
    var amountOfPeople = 0.0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setConstraints()
        createLabels()
        calculateButton.addTarget(self, action: #selector(switchVC), for: .touchUpInside)
        stepper.addTarget(self, action: #selector(stepUpdate), for: .valueChanged)
    }
    
    
    //MARK: Creating buttons
    func createLabels(){
        for index in 0..<percents.count {
            let button = UIButton()
            button.setTitle("\(percents[index]) %", for: .normal)
            button.setTitleColor(.green, for: .normal)
            button.frame.size = CGSize(width: 15.0, height: 10.0)
            button.titleLabel?.font = .systemFont(ofSize: 30)
            button.layer.cornerRadius = 10
            button.tag = index
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(percentButtonSelected), for: .touchUpInside)
            stackPercent.addArrangedSubview(button)
        }
    }
    
    //MARK: update color of current button
    @objc func percentButtonSelected(_ sender: UIButton){
        (stackPercent.arrangedSubviews[previousButton] as! UIButton).backgroundColor = stackMain.backgroundColor
        (stackPercent.arrangedSubviews[previousButton] as! UIButton).setTitleColor(.green, for: .normal)
        previousButton = sender.tag
        sender.backgroundColor = .green
        sender.setTitleColor(.white, for: .normal)
        billField.resignFirstResponder()
    }
    
    //MARK: update stepper label
    @objc func stepUpdate(){
        amountOfPeople = stepper.value
        stepLabel.text = String(format: "%0.f", amountOfPeople)
    }
    @objc func switchVC(){
        if billField.text != "" && amountOfPeople != 0 {
            resultView.countBill(Float(percents[previousButton])/100, amountOfPeople, billField.text!)
            print(Float(percents[previousButton])/100)
            print(amountOfPeople)
            print(billField.text!)
            self.navigationController?.pushViewController(resultView, animated: true)
        }
    }
}

