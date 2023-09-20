//
//  BooksList.swift
//  App01
//
//  Created by Alumno on 20/09/23.
//

import SwiftUI

struct BooksList: View {
    var books: [bookForm]
    var body: some View {
        ZStack{
            Color.red.opacity(0.5).ignoresSafeArea()
            ScrollView(.horizontal){
                HStack{
                    ForEach(books, id: \.self) { book in
                        BookDetails(book: book)
                    }
                }
            }
            
        }
    }
}

struct BooksList_Previews: PreviewProvider {
    static var previews: some View {
        let booksSeries = BooksViewModel().booksSeries
        BooksList(books: booksSeries[0].books)
    }
}
