//
//  SignupView.swift
//  Kotton App
//
//  Created by Elisabeth Manalo on 10/24/23.
//

import SwiftUI

struct SignupView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showingSignupScreen = false
    
    var body: some View {
        NavigationView { // Changed to NavigationView
            ZStack {
                Color("forest")
                    .ignoresSafeArea()
                VStack {
                    Text("Create Your Account")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(Color.white)
                        .padding()
                    Text("Please enter info to create an account")
                        .foregroundColor(Color("spring"))
                    VStack(spacing: 15.0) {
                        InputFieldView(data: $firstName, title: "First Name")
                        InputFieldView(data: $lastName, title: "Last Name")
                        InputFieldView(data: $email, title: "Email")
                        PasswordInputView(data: $password, title: "Password")
                        PasswordInputView(data: $confirmPassword, title: "Confirm Password")
                    } .padding()
                    
                    Button("Create Account") {
                        addUser(firstName: firstName, lastName: lastName, email: email, password: password, confirmPassword: confirmPassword)
                    }
                        .fontWeight(.heavy)
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("spring"))
                        .cornerRadius(40)
                        .padding()
                    
                    if showingSignupScreen {
                        NavigationLink(destination: ShopView()) {
                            Text("Welcome \(firstName) \(lastName)!")
                                .foregroundColor(Color.white)
                        }
                    }
                }
            }
        }
    }
    
    // Need to figure out how to add a database to this
    func addUser(firstName: String, lastName: String, email: String, password: String, confirmPassword: String) {
        // Not case sensitive
        if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty && !password.isEmpty && password == confirmPassword {
            showingSignupScreen = true
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
