////
////  FavoritesView.swift
////  Kotton App
////
////  Created by Elisabeth Manalo on 11/3/23.
////
//
//import SwiftUI
//
//struct FavoritesView: View {
//    
//    @State var favoriteItems: [FavoriteItem] = []
//    @Binding var favoriteItems: .constant([])
//
//    
//    var body: some View {
//        VStack {
//            Text("FAVORITE ITEMS")
//                .font(.system(size: 40))
//                .fontWeight(.black)
//            
//            Spacer()
//            
//            List {
//                ForEach (favoriteItems) { favoriteItem in
//                    
//                }
//            }
//        }
//        .padding()
//    }
//}
//
//struct FavoritesView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoritesView()
//    }
//}
