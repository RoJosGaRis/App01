//
//
//  ClassModel.swift
//  App01
//
//  Created by Alumno on 22/09/23.
//

import Foundation
import SwiftUI

struct ResultsDetailsModel : Decodable, Identifiable{
    var id = UUID()
    var index : String = " "
    var name : String = " "
    var url : String = " "
    
    enum CodingKeys : String, CodingKey {
        case index
        case name
        case url
    }
}

struct ItemsModel : Decodable {
    var count : Int
    var results : [ResultsDetailsModel]
    
    enum CodingKeys : String, CodingKey {
        case count
        case results
    }
}
