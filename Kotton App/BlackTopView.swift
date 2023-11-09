//
//  BlackTopView.swift
//  Kotton App
//
//  Created by Elisabeth Manalo on 10/31/23.
//

import SwiftUI

struct BlackTopView: View {
    
    @State var isImportant: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(alignment: .leading, spacing: 7) {
                    Image("blacktop")
                        .resizable()
                        .modifier(ImageSize())
                    HStack {
                        Text("Black Top")
                            .modifier(ProductName())
                       Button(action: {
//                           self.addItem(isFavorite: self.isFavorite)
                        }) {
                            Image(systemName: "heart")
                        }
                        
                    }
                    Text("Comfortable, cushy, pillowy feel.")
                        .modifier(ProductDesc())
                    Text("$48.00")
                        .modifier(ProductName())
                }
                .padding(9)
                .background(Rectangle().foregroundColor(.white))
                .cornerRadius(15)
                .shadow(radius: 12)
                .padding()
            }
        }
    }
    
//    private func addItem(isFavorite: Bool = false) {
//        let item = Favorite(context: context)
//        task.id = UUID()
//        task.isFavorite = isFavorite
//        
//        do {
//                    try context.save()
//        } catch {
//                    print(error)
//        }
//    }
}

struct BlackTopView_Previews: PreviewProvider {
    static var previews: some View {
        BlackTopView(isImportant: false)
    }
}
