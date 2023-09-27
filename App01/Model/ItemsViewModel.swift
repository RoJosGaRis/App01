//
//  ItemsViewModel.swift
//  App01
//
//  Created by Alumno on 27/09/23.
//

import SwiftUI

class ItemsViewModel: ObservableObject {
    
    @Published var itemsArray = [ResultsDetailsModel]()
    
    func getClassData() async throws {
        guard let url = URL(string: "https://www.dnd5eapi.co/api/equipment") else {
            print("Invalid URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else  {
            print("error")
            return
        }
        
        let results = try JSONDecoder().decode(ItemsModel.self, from: data)
        
        DispatchQueue.main.async{
            self.itemsArray = results.results
        }
        
        print(itemsArray)
    }
    
    
}
