//
//  NetworkError.swift
//  Shopping
//
//  Created by Bhuiyan Wasif on 2/12/25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case invalidJSON
    case invalidHTTPStatusCode
    case parsingError
    case dataNotFound
}
