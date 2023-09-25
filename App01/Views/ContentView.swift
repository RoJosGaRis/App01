//
//  ContentView.swift
//  App01
//
//  Created by Alumno on 19/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var classList = ClassViewModel()
    
    @State var currentColor = Color.red
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor.orange
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                Color.red
                VStack{
                    ScrollView{
                        
                        
                        ForEach(classList.classArray){
                            classInfo in
                            NavigationLink(classInfo.name, value: classInfo.url).font(.title).padding().foregroundColor(.white).border(Color.black).frame(width: UIScreen.main.bounds.width)
                        }.navigationDestination(for: String.self){
                            textValue in
                            ClassDetailsView(searchUrl: textValue)
                        }.navigationTitle("Classes")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
            
        }.task {
            do{
                try await classList.getClassData()
            } catch {
                print("error")
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
