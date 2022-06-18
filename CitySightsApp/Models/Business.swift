//
//  Business.swift
//  CitySightsApp
//
//  Created by Anand Narayan on 2022-06-14.
//

import Foundation
struct Business: Decodable {
    var id: String?
    var alias: String?
    var name: String?
    var image_url: String?
    var is_closed: Bool?
    var url: String?
    var review_count: Int?
    var categories: [Category]?
    var rating: Double?
    var coordinates:Coordinate?
    var transactions: [String]?
    var price: String?
    var location: Location?
    var phone: String?
    var display_phone: String?
    var distance: Double?
    
}
