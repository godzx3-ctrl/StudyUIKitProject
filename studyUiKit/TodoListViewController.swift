//
//  TodoListViewController.swift
//  studyUIKit
//
//  Created by Hanjuheon on 1/5/26.
//

import UIKit

class TodoListViewController : UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    
    let todos = ["운동하기", "책 읽기", "영화보기", "빨래하기"]
    
    let lineUIView:UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "할 일 목 록"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
       let addTodoButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("새 할 일 추가", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
//        button.addAction(UIAction { [weak self] _ in
//            self?.addTodoAction()
//        },
//        for: .touchUpInside)
        return button
    }()
    
    lazy var todoTableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TodoCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTodoButton.addAction(UIAction { [weak self] _ in self?.addTodoAction() }, for: .touchUpInside)
        
        view.addSubview(titleLabel)
        view.addSubview(lineUIView)
        view.addSubview(todoTableView)
        view.addSubview(addTodoButton)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:  20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            lineUIView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            lineUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lineUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lineUIView.heightAnchor.constraint(equalToConstant:1),
            
            todoTableView.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            todoTableView.topAnchor.constraint(equalTo:titleLabel.bottomAnchor, constant: 20),
            todoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            todoTableView.heightAnchor.constraint(equalToConstant: 500),
            
            addTodoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addTodoButton.topAnchor.constraint(equalTo: todoTableView.bottomAnchor, constant: 40),
            addTodoButton.heightAnchor.constraint(equalToConstant: 50),
            addTodoButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        cell.textLabel?.text = todos[indexPath.row]
        return cell
    }
    
    
    private func addTodoAction(){
        
    }
}

#Preview
{
    TodoListViewController()
}
