//
//  Location.swift
//  CitySightsApp
//
//  Created by Anand Narayan on 2022-06-14.
//

import Foundation

struct Location: Decodable {
    var address1: String?
    var address2: String?
    var address3: String?
    var city: String?
    var zip_code: String?
    var country: String?
    var state: String?
    var display_address: [String]?
}
