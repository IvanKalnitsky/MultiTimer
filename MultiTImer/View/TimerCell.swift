//
//  TimerCell.swift
//  MultiTImer
//
//  Created by macbookp on 04.07.2021.
//

import UIKit

class TimerCell: UITableViewCell {
    
    static let reuseIdentifier = "TimerCell"

    var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    var timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var labelsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
          
    func makeConstraints() {
        addSubview(labelsStack)
        labelsStack.addArrangedSubview(nameLabel)
        labelsStack.addArrangedSubview(timeLabel)
        labelsStack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        labelsStack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20).isActive = true
        labelsStack.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20).isActive = true
        labelsStack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func configure(name: String, time: Double) {
        backgroundColor = #colorLiteral(red: 0.8692996625, green: 0.8692996625, blue: 0.8692996625, alpha: 1)
        makeConstraints()
        nameLabel.text = name
        timeLabel.text = timeString(time: time)
    }
    
    func timeString(time: Double) -> String {
        let hours = Int((time/3600).truncatingRemainder(dividingBy: 60))
        let minuts = Int((time/60).truncatingRemainder(dividingBy: 60))
        let secunds = Int(time.truncatingRemainder(dividingBy: 60))
        return String(format: "%02i:%02i:%02i", hours,minuts,secunds)
    }
}
