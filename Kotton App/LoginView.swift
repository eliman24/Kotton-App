//
//  LoginView.swift
//  Kotton App
//
//  Created by Elisabeth Manalo on 10/23/23.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
//    @State private var wrongUsername: Float = 0
//    @State private var wrongPassword: Float = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("Kotton")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding(.bottom, 42)
                    VStack(spacing: 16.0) {
                        InputFieldView(data: $username, title: "Username")
//                            .border(.red, width: CGFloat(wrongUsername))
                        PasswordInputView(data: $password, title: "Password")
//                            .border(.red, width: CGFloat(wrongPassword))
                    } .padding()
                    Button("Sign In") {
                        authenticateUser(username: username, password: password)
                    }
                        .fontWeight(.heavy)
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(.green)
                        .cornerRadius(40)
                        .padding()
                    
                    if showingLoginScreen {
                        NavigationLink(destination: ShopView()) {
                            Text("You are logged in @\(username)")
                        }
                    }

                    
                    HStack {
                        Spacer()
                        Text("Forgot Password?")
                            .fontWeight(.thin)
                            .foregroundColor(Color.blue)
                            .underline()
                    }.padding(16)
                }
            }
        }
    }
    
    // need to figure out how to add database to this
    func authenticateUser(username: String, password: String) {
        // not case sensitive
        if username == "Lissiemanalo" {
            if password == "Year_of2024" {
                showingLoginScreen = true
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
