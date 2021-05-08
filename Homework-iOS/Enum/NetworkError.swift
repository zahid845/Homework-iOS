//
//  NetworkError.swift
//  Homework-iOS
//
//  Created by Admin on 5/8/21.
//

import Foundation

//Possible errors we can encounter
enum NetworkError: Error {

    case domainError
    case decodingError
    case responseError
    case encodingError
}
