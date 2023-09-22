//
//  ClassViewModel.swift
//  App01
//
//  Created by Alumno on 22/09/23.
//

import SwiftUI

class ClassViewModel: ObservableObject {
    
    @Published var classArray = [ClassModel]()
    
    func getClassData() async throws {
        guard let url = URL(string: "https://www.dnd5eapi.co/api/classes") else {
            print("Invalid URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, request) = try await URLSession.shared.data(for: urlRequest)
        
        let results = try JSONDecoder().decode(ClassModel.self, from: data)
        
        print(results)
    }
}

