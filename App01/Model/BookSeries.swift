//
//  BookSeries.swift
//  App01
//
//  Created by Alumno on 19/09/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct BookSeries: Hashable, Codable, Identifiable{
    var id: Int
    var name: String
    var writer: String
    
    var books:[bookForm]
    
    
}
