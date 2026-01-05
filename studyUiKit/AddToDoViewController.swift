//
//  AddToDoViewController.swift
//  studyUiKit
//
//  Created by Hanjuheon on 1/5/26.
//

import UIKit


class AddToDoViewController: UIViewController{
    
    let addTodoTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "추가할 새 할일을 작성헤주세요."
        textField.text = ""
        textField.font = UIFont.systemFont(ofSize:30)
        textField.backgroundColor = .systemGray6
        return textField
    }()
    
    let addButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("추가", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.backgroundColor = .blue
        return button
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.addSubview(addTodoTextField)
        view.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            addTodoTextField.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            addTodoTextField.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 50),
            addTodoTextField.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant:20),
            
            addButton.centerXAnchor.constraint(equalTo: addTodoTextField.centerXAnchor),
            addButton.topAnchor.constraint(equalTo: addTodoTextField.bottomAnchor,constant: 50),
            addButton.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}

#Preview
{
    AddToDoViewController()
}
