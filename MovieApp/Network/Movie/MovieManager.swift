//
//  MovieManager.swift
//  MovieApp
//
//  Created by Rustem Manafov on 02.09.22.
//

import Foundation

class MovieManager {
    
    static let shared = MovieManager()
    
    func getArchiveNewsList(complete: @escaping((Movie?, String?)->())) {
        let url = NetworkHelper.shared.baseURL
        
        NetworkManager.shared.request(type: Movie.self,
                                      url: url,
                                      method: .get) { response in
            switch response {
            case .success(let model):
                complete(model, nil)
            case .failure(let error):
                complete(nil, error.localizedDescription)
            }
        }
    }
    
//    func searchArchive(text: String, complete: @escaping((Movie?, String?) -> ())) {
//        let url = NetworkHelper.shared.baseURL + "/search/v2/articlesearch.json?q=\(text)&api-key=wQApKyTUq8E5THM9HVdOGem7gohHBZTj"
//        
//        NetworkManager.shared.request(type: Movie.self,
//                                      url: url,
//                                      method: .get) { response in
//            switch response {
//            case .success(let model):
//                complete(model, nil)
//            case .failure(let error):
//                complete(nil, error.localizedDescription)
//            }
//        }
//    }
}
