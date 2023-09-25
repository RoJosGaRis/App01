//
//  ClassViewModel.swift
//  App01
//
//  Created by Alumno on 22/09/23.
//

import SwiftUI

class ClassViewModel: ObservableObject {
    
    @Published var classArray = [ResultsModel]()
    
    func getClassData() async throws {
        guard let url = URL(string: "https://www.dnd5eapi.co/api/classes") else {
            print("Invalid URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else  {
            print("error")
            return
        }
        
        let results = try JSONDecoder().decode(ClassModel.self, from: data)
        
        DispatchQueue.main.async{
            self.classArray = results.results
        }
        
        print(classArray)
    }
    
    
}

