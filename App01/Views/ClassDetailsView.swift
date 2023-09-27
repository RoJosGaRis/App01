//
//  ClassDetailsView.swift
//  App01
//
//  Created by Alumno on 22/09/23.
//

import SwiftUI

struct ClassDetailsView: View {
    
    var searchUrl:String
    
    @StateObject var classDetails = ClassDetailsViewModel()
    
    var body: some View {
        ZStack{
            
            Color.teal.ignoresSafeArea()
        VStack{
            
            Text("Hit Die")
                List{
                    Text("\(classDetails.classDetails.hit_die)").foregroundColor(.white).listRowBackground(Color.teal)
                }
                .frame(maxHeight: 100).scrollContentBackground(.hidden).border(.white)
            
            Text("Proficiencies")
            List(classDetails.classDetails.proficiencies){proficiency in
                Text(proficiency.name).foregroundColor(.white).listRowBackground(Color.teal)
            }.scrollContentBackground(.hidden).border(.white)
        }
        .task {
            do{
                try await
                classDetails.getClassDetails(searchUrl: "https://www.dnd5eapi.co\(searchUrl)")
                print(searchUrl)
            } catch {
                print("error")
            }
        }.padding().font(.title)
        }
    }
}

struct ClassDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ClassDetailsView(searchUrl: "something")
    }
}
