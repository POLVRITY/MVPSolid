//
//  DetailPresenter.swift
//  MVPSolid
//
//  Created by Владислав Белый on 25.01.2023.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setComment(comment: Comment?)
    func setName(name: Comment?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: Comment?, router: RouterProtocol)
    func setComment()
    func setName()
    func tap()
}

class DetailPresenter: DetailViewPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    
    var router: RouterProtocol?
    var comment: Comment?

    let networkService: NetworkServiceProtocol!

    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: Comment?, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
        self.router = router
    }
    
    public func setComment() {
        self.view?.setComment(comment: comment)
    }
    
    public func setName() {
        self.view?.setName(name: comment)
    }
    
    func tap() {
        router?.popToRoot()
    }
}


