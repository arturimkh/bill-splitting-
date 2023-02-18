//
//  Extensions .swift
//  bill splitting bill
//
//  Created by Artur Imanbaev on 18.02.2023.
//

import Foundation
import UIKit
extension ResultViewController{
    func setConstraints(){
        view.backgroundColor = .white
        view.addSubview(viewTotal)
        NSLayoutConstraint.activate([
            viewTotal.topAnchor.constraint(equalTo: view.topAnchor),
            viewTotal.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: viewTotal.trailingAnchor),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: viewTotal.bottomAnchor, multiplier: 60)
        ])
        viewTotal.addSubview(moneyLabel)
        NSLayoutConstraint.activate([
            moneyLabel.centerXAnchor.constraint(equalTo: viewTotal.centerXAnchor),
            moneyLabel.centerYAnchor.constraint(equalTo: viewTotal.centerYAnchor)
        ])
        viewTotal.addSubview(totalLabel)
        NSLayoutConstraint.activate([
            totalLabel.centerXAnchor.constraint(equalTo: viewTotal.centerXAnchor),
            totalLabel.bottomAnchor.constraint(equalToSystemSpacingBelow: moneyLabel.topAnchor, multiplier: -5)
        ])
        view.addSubview(recalculateButton)
        NSLayoutConstraint.activate([
            recalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: recalculateButton.bottomAnchor, multiplier: 5),
            recalculateButton.heightAnchor.constraint(equalToConstant: 80),
            recalculateButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        view.addSubview(infoLabel)
        NSLayoutConstraint.activate([
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: infoLabel.bottomAnchor, multiplier: 50)
        ])
    }
}

extension ViewController{
    func setConstraints(){
        view.backgroundColor = .white
        view.addSubview(stackMain)
        NSLayoutConstraint.activate([
            stackMain.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 30),
            stackMain.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.bottomAnchor.constraint(equalTo: stackMain.bottomAnchor),
            view.trailingAnchor.constraint(equalTo: stackMain.trailingAnchor)
        ])
        view.addSubview(billField)
        NSLayoutConstraint.activate([
            billField.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 15),
            billField.bottomAnchor.constraint(equalToSystemSpacingBelow: stackMain.topAnchor, multiplier: -3),
            billField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: billField.trailingAnchor)
        ])
        view.addSubview(enterLabel)
        NSLayoutConstraint.activate([
            enterLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            enterLabel.bottomAnchor.constraint(equalTo: billField.topAnchor),
            enterLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3)
        ])
        stackMain.addSubview(calculateButton)
        NSLayoutConstraint.activate([
            calculateButton.centerXAnchor.constraint(equalTo: stackMain.centerXAnchor),
            stackMain.bottomAnchor.constraint(equalToSystemSpacingBelow: calculateButton.bottomAnchor, multiplier: 5),
            calculateButton.heightAnchor.constraint(equalToConstant: 80),
            calculateButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        stackMain.addSubview(stackPercent)
        NSLayoutConstraint.activate([
            stackPercent.topAnchor.constraint(equalToSystemSpacingBelow: stackMain.topAnchor, multiplier: 10),
            stackMain.bottomAnchor.constraint(equalToSystemSpacingBelow: stackPercent.bottomAnchor, multiplier: 60),
            stackPercent.leadingAnchor.constraint(equalToSystemSpacingAfter: stackMain.leadingAnchor, multiplier: 5),
            stackMain.trailingAnchor.constraint(equalToSystemSpacingAfter: stackPercent.trailingAnchor, multiplier: 5),
        ])
        stackMain.addSubview(selectTipLabel)
        NSLayoutConstraint.activate([
            selectTipLabel.topAnchor.constraint(equalTo: stackMain.safeAreaLayoutGuide.topAnchor),
            selectTipLabel.bottomAnchor.constraint(equalTo: stackPercent.topAnchor),
            selectTipLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: stackMain.leadingAnchor, multiplier: 3)
        ])
        stackMain.addSubview(stepper)
        NSLayoutConstraint.activate([
            stepper.trailingAnchor.constraint(equalTo: stackMain.trailingAnchor, constant: -70),
            stepper.topAnchor.constraint(equalTo: stackPercent.bottomAnchor, constant: 50)
        ])
        stackMain.addSubview(stepLabel)
        NSLayoutConstraint.activate([
            stepLabel.leadingAnchor.constraint(equalTo: stackMain.leadingAnchor, constant: 70),
            stepLabel.topAnchor.constraint(equalTo: stackPercent.bottomAnchor, constant: 50),
            stepLabel.centerYAnchor.constraint(equalTo: stepper.centerYAnchor)
        ])
        stackMain.addSubview(splitLabel)
        NSLayoutConstraint.activate([
            splitLabel.bottomAnchor.constraint(equalTo: stepLabel.topAnchor,constant: -15),
            splitLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: stackMain.leadingAnchor, multiplier: 3)
        ])
    }
}

