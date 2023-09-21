//
//  BookDetails.swift
//  App01
//
//  Created by Alumno on 20/09/23.
//

import SwiftUI

struct BookDetails: View {
    
    var book : bookForm
    
    var body: some View {
        VStack{
            
            Image(book.bookImageName).resizable().scaledToFit().cornerRadius(25).shadow(color: Color.black, radius: 5)
            VStack{
                
                
                Text(book.name).font(.title).bold().foregroundColor(Color.white)
                HStack{
                    Text("Page count: ").font(.title2).foregroundColor(Color.white)
                    Text(String(book.pages)).bold()
                }
                HStack{
                    Text("Published: ").font(.title2).foregroundColor(.white)
                    Text(String(book.year)).bold()
                }
                Link(
                    destination: URL(string: book.goodReadsLink)!){
                        ZStack{
                            Image(systemName: "book").foregroundColor(.white)
                        }.padding().background(Color.black).clipShape(Circle())
                    }
            }.padding()
            
            
        }.background(Color.red).cornerRadius(25).padding().shadow(color: Color.black, radius: 5 )
    }
}

struct BookDetails_Previews: PreviewProvider {
    static var previews: some View {
        let booksSeries = BooksViewModel().booksSeries
        ZStack{
            Color.red.opacity(0.5).ignoresSafeArea()
            BookDetails(book: booksSeries[0].books[0])
        }
        
    }
}
