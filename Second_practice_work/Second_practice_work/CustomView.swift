//
//  CustomView.swift
//  Second_practice_work
//
//  Created by Дмитрий Соболев on 01.10.2023.
//

import UIKit

final class CustomView: UIView {
    
    let textField = UITextField()
    let line = UIView()
    var text: String?
    
    init(delegate: UITextFieldDelegate) {
        super.init(frame: .zero)
        textField.delegate = delegate
        configurateUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configurateUI() {
        textField.placeholder = "Введите номер телефона"
        textField.translatesAutoresizingMaskIntoConstraints = false
        text = textField.text
        
        addSubview(textField)
        addSubview(line)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            textField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        ])
        
        line.backgroundColor = .black
        line.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            line.heightAnchor.constraint(equalToConstant: 1.0),
            line.topAnchor.constraint(equalTo: textField.bottomAnchor),
            line.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            line.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
