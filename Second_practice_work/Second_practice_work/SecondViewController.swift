//
//  SecondViewController.swift
//  Second_practice_work
//
//  Created by Дмитрий Соболев on 01.10.2023.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func changeCode(code1: String)
}

final class SecondViewController: UIViewController, ViewControllerDelegate {
    
    
    var field = UITextField()
    
    var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(field)
        NSLayoutConstraint.activate([
            field.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            field.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            field.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            field.heightAnchor.constraint(equalToConstant: 48)
        ])
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = " Введите код"
        field.borderStyle = .line
        field.delegate = self
    }
    
}

extension SecondViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ field: UITextField) {
        if let l = field.text {
            if l.count == 4 {
                self.delegate?.changeCode(code1: l)
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
