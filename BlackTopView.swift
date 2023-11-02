//
//  BlackTopView.swift
//  Kotton App
//
//  Created by Elisabeth Manalo on 10/31/23.
//

import SwiftUI

struct BlackTopView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                HStack {
                    VStack(alignment: .leading, spacing: 7) {
                        Image("blacktop")
                            .resizable()
                            .modifier(ImageSize())
                        Text("Black Top")
                            .modifier(ProductName())
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
    }
}

struct BlackTopView_Previews: PreviewProvider {
    static var previews: some View {
        BlackTopView()
    }
}
