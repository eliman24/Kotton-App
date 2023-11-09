//
//  ShopView.swift
//  Kotton App
//
//  Created by Elisabeth Manalo on 10/26/23.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack {
                        Text("Kotton")
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .padding(.bottom, 42)
                        NavigationLink(destination: QuizView()) {
                            Text("TAKE SUSTAINABILITY QUIZ")
                        }
                            .fontWeight(.black)
                        Text("(might be a different type of quiz)")
                            .padding(.bottom, 42)
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
                                .modifier(ProductIcon())

                            VStack(alignment: .leading, spacing: 7) {
                                Image("darkjeans")
                                    .resizable()
                                    .modifier(ImageSize())
                                Text("Dark-Wash Jeans")
                                    .modifier(ProductName())
                                Text("Frayed wide-leg bottoms.")
                                    .modifier(ProductDesc())
                                Text("$27.00")
                                    .modifier(ProductName())
                            }
                            .modifier(ProductIcon())
                        }
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 7) {
                                Image("whitedress")
                                    .resizable()
                                    .modifier(ImageSize())
                                Text("White Dress")
                                    .modifier(ProductName())
                                Text("Cute babydoll dress")
                                    .modifier(ProductDesc())
                                Text("$48.00")
                                    .modifier(ProductName())
                            }
                            .modifier(ProductIcon())
                            
                            VStack(alignment: .leading, spacing: 7) {
                                Image("cashmeresweater")
                                    .resizable()
                                    .modifier(ImageSize())
                                Text("Cashmere Sweater")
                                    .modifier(ProductName())
                                Text("Fuzzy cashmere sweater")
                                    .modifier(ProductDesc())
                                Text("$27.00")
                                    .modifier(ProductName())
                            }
                            .modifier(ProductIcon())
                        }
                    }
                }
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}
    
struct ImageSize: ViewModifier {
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fit)
            .cornerRadius(15)
    }
}

struct ProductName: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            
    }
}

struct ProductDesc: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.gray)
    }
}

struct ProductIcon : ViewModifier {
    func body(content: Content) -> some View {
        NavigationLink(destination: BlackTopView(isImportant: false)) {
            content
        }
            .padding(9)
            .background(Rectangle().foregroundColor(.white))
            .cornerRadius(15)
            .shadow(radius: 12)
            .padding()
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
