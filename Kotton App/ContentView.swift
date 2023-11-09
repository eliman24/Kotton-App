//
//  ContentView.swift
//  Kotton App
//
//  Created by Elisabeth Manalo on 10/19/23.
//

import SwiftUI

struct ContentView: View {
    
    @FetchRequest(
            entity: Favorite.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \Favorite.id, ascending: false) ])
        
    var favoriteItems: FetchedResults<Favorite>
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("forest")
                    .ignoresSafeArea()
                VStack {
                    Text("Welcome to\n      Kotton")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .fontWeight(.black)
                        .padding(.bottom, 42)
                    Text("Kotton is a ...")
                        .foregroundColor(Color("spring"))
                    VStack() {
                        NavigationLink(destination: LoginView()) {
                        Text("Login")
                            .fontWeight(.heavy)
                            .font(.title3)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("spring"))
                            .cornerRadius(40)
                        }
                        NavigationLink(destination: SignupView()) {
                        Text("Register")
                            .fontWeight(.heavy)
                            .font(.title3)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("spring"))
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
//        ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
}
