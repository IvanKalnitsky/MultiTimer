//
//  InfoForTimerCell.swift
//  MultiTImer
//
//  Created by macbookp on 04.07.2021.
//

import UIKit

protocol InfoTimerCellDelegate: AnyObject {
    func addTimer(nameText: String?,timeText: String?)
}

class InfoTimerCell: UITableViewCell, UITextFieldDelegate {
    
    static let reuseIdentifier = "InfoTimerCell"
    var delegate: InfoTimerCellDelegate?
    
    private var nameTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Название таймера"
        tf.backgroundColor = #colorLiteral(red: 0.9630557188, green: 0.9630557188, blue: 0.9630557188, alpha: 1)
        tf.layer.cornerRadius = 10
        tf.clearButtonMode = UITextField.ViewMode.whileEditing
        return tf
    }()
    
    private var timeTF: UITextField = {
        let tf = UITextField()
        tf.textContentType = .creditCardNumber
        tf.placeholder = "Время в секундах"
        tf.backgroundColor = #colorLiteral(red: 0.9630557188, green: 0.9630557188, blue: 0.9630557188, alpha: 1)
        tf.layer.cornerRadius = 10
        tf.clearButtonMode = UITextField.ViewMode.whileEditing
        return tf
    }()
    
    private var addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.8692996625, green: 0.8692996625, blue: 0.8692996625, alpha: 1)
        button.setTitle(" Добавить", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitleColor(#colorLiteral(red: 0.1760740628, green: 0.3814248518, blue: 0.8549019694, alpha: 1), for: .normal)
        button.setTitleColor(.white, for: .highlighted)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var tfStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 20
        return stack
    }()
    
    func configure() {
        makeConstraints()
        selectionStyle = .none
        backgroundColor = .white
        nameTF.delegate = self
        timeTF.delegate = self
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
    }
    
    private func makeConstraints() {
        addSubview(tfStack)
        [nameTF,timeTF].forEach { self.tfStack.addArrangedSubview($0) }
        tfStack.topAnchor.constraint(equalTo: topAnchor,constant: 30).isActive = true
        tfStack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20).isActive = true
        tfStack.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -150).isActive = true
        tfStack.heightAnchor.constraint(equalToConstant: 100).isActive = true
        addSubview(addButton)
        addButton.topAnchor.constraint(equalTo: tfStack.bottomAnchor, constant: 40).isActive = true
        addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        addButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -15).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func addButtonPressed() {
        let name = nameTF.text
        let time = timeTF.text
        delegate?.addTimer(nameText: name, timeText: time)
    }
}
