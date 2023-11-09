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
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("forest")
                    .ignoresSafeArea()
                VStack {
                    Text("Kotton")
                        .font(.largeTitle)
                        .padding(.bottom, 42)
                        .foregroundColor(.white)
                    VStack(spacing: 16.0) {
//                        InputFieldView(data: $username, title: "Username")
//                        PasswordInputView(data: $password, title: "Password")
                        TextField("Username", text: $username)
                           .padding()
                           .frame(width: 300, height: 50)
                           .background(Color.black.opacity(0.05))
                           .cornerRadius(10)
                           .border(Color("spring"))
                           .border(.red, width: CGFloat(wrongUsername))
                        SecureField("Password", text: $password)
                            .padding()
                            .frame(width: 300, height: 50)
                            .cornerRadius(10)
                            .border(Color("spring"))
                            .border(.red, width: CGFloat(wrongPassword))
                    } .padding()
                    Button("Sign In") {
                        authenticateUser(username: username, password: password)
                    }
                        .fontWeight(.heavy)
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("spring"))
                        .frame(width: 300, height: 70)
                        .cornerRadius(100)
                        .padding()
                    
                    if showingLoginScreen {
                        NavigationLink(destination: ShopView()) {
                            Text("Welcome back @\(username)!")
                                .foregroundColor(Color.white)
                        }
                    }

                    
                    HStack {
                        Text("Don't have an account?")
                            .fontWeight(.medium)
                            .foregroundColor(Color("spring"))
                        NavigationLink(destination: SignupView()) {
                            Text("Sign up?")
                        }
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                            .underline()
                    }.padding(16)
                }
            }
        }
    }
    
    // need to figure out how to add database to this
    func authenticateUser(username: String, password: String) {
        // not case sensitive
        if username.lowercased() == "lissiemanalo" {
            wrongUsername = 0
            if password.lowercased() == "year_of2024" {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
