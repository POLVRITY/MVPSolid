//
//  DetailViewController.swift
//  MVPSolid
//
//  Created by Владислав Белый on 25.01.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var presenter: DetailViewPresenterProtocol!
    
    let label: UILabel = {
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
    }
    
    private func setupView() {
        view.addSubview(label)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20),
            
            button.centerXAnchor.constraint(equalTo: label.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
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
        label.text = comment?.email
    }
    
    
}
