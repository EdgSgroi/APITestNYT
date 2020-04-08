//
//  ViewModel.swift
//  APITestNYT
//
//  Created by Edgar Sgroi on 08/04/20.
//  Copyright © 2020 Edgar Sgroi. All rights reserved.
//

import Foundation
import UIKit
import NotificationCenter

class ViewModel {
    
    let service = APIRequest()
    var articles: [Article] = []
    
    init() {
        articlesRequest()
    }
    
    func articlesRequest() {
        service.makeRequest({ (response) in
            switch response {
            case .success(let art):
                self.articles = art.results
                NotificationCenter.default.post(name: .updateList, object: nil)
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        })
    }
    
    func rowsNumber() -> Int {
        return articles.count
    }
    
    func getArticleTitle(for indexPath: IndexPath) -> String {
        return articles[indexPath.row].title
    }
}

extension Notification.Name {
    static let updateList = Notification.Name("update_list")
}
