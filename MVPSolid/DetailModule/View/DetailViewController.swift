//
//  DetailViewController.swift
//  MVPSolid
//
//  Created by Владислав Белый on 25.01.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var presenter: DetailViewPresenterProtocol!
    
    let commentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Test Label"
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Test Label"
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("TAP ME", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupView()
        presenter.setComment()
        presenter.setName()
    }
    
    private func setupView() {
        view.addSubview(commentLabel)
        view.addSubview(nameLabel)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: commentLabel.topAnchor, constant: -20),
            nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20),
            
            commentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            commentLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            commentLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20),
            
            button.centerXAnchor.constraint(equalTo: commentLabel.centerXAnchor),
            button.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 30),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 33)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func tapAction(sender: UIButton) {
        presenter.tap()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        commentLabel.text = comment?.body
    }
    
    func setName(name: Comment?) {
        nameLabel.text = name?.email
    }
}
