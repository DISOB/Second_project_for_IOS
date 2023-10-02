//
//  ViewController.swift
//  Second_practice_work
//
//  Created by Дмитрий Соболев on 01.10.2023.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
}

class ViewController: UIViewController, SecondViewControllerDelegate {
    
    var delegate: ViewControllerDelegate?
    
    let button = UIButton()
    var code: String?
    let label = UILabel()
    
    private lazy var textField = CustomView(delegate: self)
    
    private func config() {
        view.backgroundColor = .white
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 48)
        ])
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 68),
            button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8.0
        button.backgroundColor = .purple
        button.setTitle("Получить код", for: .normal)
        
        if textField.text == "" {
           button.isEnabled = false
        }
        
        button.addAction(
            .init {[weak self] _ in
                guard let self else { return }
                let vc = SecondViewController()
                vc.view.backgroundColor = .white
                vc.delegate = self
                self.navigationController?.pushViewController(vc, animated: true)
            }, for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    func changeCode(code1: String) {
        code = code1
        if let l = code {
            label.text = "Code: " + l
            view.addSubview(label)
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                label.topAnchor.constraint(equalTo: textField.line.bottomAnchor, constant: 4),
            ])
            label.translatesAutoresizingMaskIntoConstraints = false
            
        }
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text, !text.isEmpty else {
            button.isEnabled = false
            return
        }
        button.isEnabled = true
    }
}

