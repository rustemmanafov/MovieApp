//
//  NetworkHelper.swift
//  MovieApp
//
//  Created by Rustem Manafov on 02.09.22.
//

import Foundation
import Alamofire

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

enum ErrorTypes: String, Error {
    case invalidData = "Invalid data"
    case invalidURL = "Invalid url"
    case generalError = "An error happened"
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    let baseURL = "https://movies-app1.p.rapidapi.com/api/movies"
    
    let imageBaseURL = "https://image.tmdb.org/t/p/w300/c0p6YAhrl5tLNqXydVUotJiEufR.jpg"
    
    let headers: HTTPHeaders = [
        "X-RapidAPI-Key": "4c1a11c78amsh5b31727fa31390fp18b603jsnaca1b20cf478",
        "X-RapidAPI-Host": "movies-app1.p.rapidapi.com"
    ]
    
    func saveToken(token: String) {
        //KeychainHelper.save(value: token, key: .token)
    }
    
}
