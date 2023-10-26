//
//  ContentView.swift
//  Kotton App
//
//  Created by Elisabeth Manalo on 10/19/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("Welcome to\n      Kotton")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding(.bottom, 42)
                    Text("Kotton is a ...")
                    VStack() {
                        NavigationLink(destination: LoginView()) {
                        Text("Login")
                            .fontWeight(.heavy)
                            .font(.title3)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(.green)
                            .cornerRadius(40)
                        }
                        NavigationLink(destination: SignupView()) {
                        Text("Register")
                            .fontWeight(.heavy)
                            .font(.title3)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(.green)
                            .cornerRadius(40)
                        }
                    } .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
