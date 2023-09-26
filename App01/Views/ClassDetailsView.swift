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
            
            Color.red.ignoresSafeArea()
        VStack{
            
            Text("Hit Die")
                List{
                    Text("\(classDetails.classDetails.hit_die)").foregroundColor(.black).listRowBackground(Color.red)
                }
                .frame(maxHeight: 100).scrollContentBackground(.hidden).border(.black)
            
            Text("Proficiencies")
            List(classDetails.classDetails.proficiencies){proficiency in
                Text(proficiency.name).foregroundColor(.black).listRowBackground(Color.red)
            }.scrollContentBackground(.hidden).border(.black)
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
