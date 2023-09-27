//
//  ContentView.swift
//  App01
//
//  Created by Alumno on 19/09/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView{
            ClassesView().tabItem{
                Label( "Classes", systemImage: "person.circle.fill").foregroundColor(.black)
            }
            
            ItemsView().tabItem{
                Label("Items", systemImage: "bag.fill").foregroundColor(.black)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
