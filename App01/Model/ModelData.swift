//
//  ModelData.swift
//  App01
//
//  Created by Alumno on 19/09/23.
//

import Foundation
import SwiftUI

//var bookSeries: [BookSeries] = load("bookData.json")

class BooksViewModel : ObservableObject{
    @Published var booksSeries = [BookSeries]()
    
    init(){
        getBooks()
    }
    
    func getBooks(){
        if let url = Bundle.main.url(forResource: "bookData", withExtension: ".json"){
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                self.booksSeries = try decoder.decode([BookSeries].self, from: data)
            } catch {
                print("Error loading and decoding JSON: \(error)")
            }
        } else {
            print("JSON file not found")
        }
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do{
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
