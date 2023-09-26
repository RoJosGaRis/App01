//
//  ClassesView.swift
//  App01
//
//  Created by Alumno on 26/09/23.
//

import SwiftUI

struct ClassesView: View {
    
    @StateObject var classList = ClassViewModel()
    
    @State var currentColor = Color.red
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor.black
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.red]
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.red.ignoresSafeArea()
                VStack{

                        List(classList.classArray){
                            classInfo in
                            NavigationLink(classInfo.name, value: classInfo.url).font(.title).padding().foregroundColor(.black).listRowBackground(Color.red).border(Color.black) }.navigationDestination(for: String.self){
                            textValue in
                            ClassDetailsView(searchUrl: textValue)
                        
                            }.navigationTitle("Classes")
                        .navigationBarTitleDisplayMode(.inline).scrollContentBackground(.hidden)
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

struct ClassesView_Previews: PreviewProvider {
    static var previews: some View {
        ClassesView()
    }
}
