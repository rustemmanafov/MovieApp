//
//  MovieModel.swift
//  MovieApp
//
//  Created by Rustem Manafov on 05.09.22.
//

import Foundation

class MovieModel {
    
    var items = [MovieResult]()

    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    func getList() {
        MovieManager.shared.getArchiveNewsList { item, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let docs = item?.movieResponce {
                self.items = docs
                self.successCallback?()
            }
        }
    }
    
//    func searchArticles(text: String) {
//        MovieManager.shared.searchArchive(text: text) { item, errorMessage in
//            if let errorMessage = errorMessage {
//                self.errorCallback?(errorMessage)
//            } else if let docs = item?.movieResponce {
//                self.items = docs
//                self.successCallback?()
//            }
//        }
//    }
}
