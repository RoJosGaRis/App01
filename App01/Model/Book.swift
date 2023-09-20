//
//  Book.swift
//  App01
//
//  Created by Alumno on 20/09/23.
//

import Foundation
import SwiftUI

struct bookForm:Hashable, Codable{
    var name: String
    var year: Int
    var pages: Int
    var bookImageName: String
    var bookImage: Image {
        Image(bookImageName)
    }
}
