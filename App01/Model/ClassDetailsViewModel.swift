//
//  ClassDetailsViewModel.swift
//  App01
//
//  Created by Alumno on 22/09/23.
//

import SwiftUI

class ClassDetailsViewModel: ObservableObject {

    @Published var classDetails = ClassDetails()
    
    func getClassDetails(searchUrl : String) async throws {
        guard let url = URL(string: searchUrl) else {
            print("Invalid URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else  {
            print("error")
            return
        }
        
        let results = try JSONDecoder().decode(ClassDetails.self, from: data)
        
        self.classDetails = results
    }
}

