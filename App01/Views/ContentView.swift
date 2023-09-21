//
//  ContentView.swift
//  App01
//
//  Created by Alumno on 19/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var booksSeries = BooksViewModel()
    
    var body: some View {
        ZStack{
            Color(.black).ignoresSafeArea()
            BookSeriesList(booksSeries: booksSeries.booksSeries)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
