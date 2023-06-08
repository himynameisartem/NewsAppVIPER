//
//  NewsListIneractor.swift
//  NewsAppVIPER
//
//  Created by Артем Кудрявцев on 08.06.2023.
//

import Foundation

class NewsListInteractor {
    
    weak var presenter: NewsListInteractorOutputProtocol!
    
    required init(presenter: NewsListInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

extension NewsListInteractor: NewsListInteractorProtocol {
    func fetchNews() {
        NetworkManager.shared.fetchNews { [weak self] news in
            self?.presenter.newsDidRecieve(news)
        }
    }
}
