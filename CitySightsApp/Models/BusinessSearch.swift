//
//  BusinessSearch.swift
//  CitySightsApp
//
//  Created by Anand Narayan on 2022-06-14.
//

import Foundation

struct BusinessSearch: Decodable {
    var businesses = [Business]()
    var total = 0
    var region = Region()
}

struct Region: Decodable {
    var center = Coordinate()
}
