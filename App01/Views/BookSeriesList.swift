//
//  BookSeriesList.swift
//  App01
//
//  Created by Alumno on 19/09/23.
//

import SwiftUI

struct BookSeriesList: View {
    var body: some View {
        List(books){
            book in
            Text("Si")
        }
    }
}

struct BookSeriesList_Previews: PreviewProvider {
    static var previews: some View {
        BookSeriesList()
    }
}
