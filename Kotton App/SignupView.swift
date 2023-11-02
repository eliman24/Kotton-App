//
//  SignupView.swift
//  Kotton App
//
//  Created by Elisabeth Manalo on 10/24/23.
//

import SwiftUI

struct SignupView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("Create Your Account")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding()
                    Text("Please enter info to create account")
                    VStack(spacing: 15.0) {
                        InputFieldView(data: $name, title: "Name")
                        InputFieldView(data: $email, title: "Email")
                        PasswordInputView(data: $password, title: "Password")
                        PasswordInputView(data: $password, title: "Confirm Password")
                    } .padding()
                    
                    NavigationLink(destination: ShopView()) {
//                        addUser(name: name, email: email, password: password)
                        Text("Create Account")
                    }
                        .fontWeight(.heavy)
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(.green)
                        .cornerRadius(40)
                        .padding()
                }
            }
        }
    }
}

// need to figure out how to add database to this
func addUser(name: String, email: String, password: String) {
    // not case sensitive
    if name != "" {
        if email != "" {
            if password != "" {
                
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
