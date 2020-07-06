//
//  ApiResponse.swift
//  gonettest
//
//  Created by Ernesto Valdez on 05/07/20.
//  Copyright © 2020 Ernesto Valdez. All rights reserved.
//

import Foundation

// MARK: - APIResponse
struct APIResponse: Codable {
    let page, totalResults, totalPages: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}

