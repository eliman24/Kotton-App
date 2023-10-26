//
//  QuizView.swift
//  Kotton App
//
//  Created by Elisabeth Manalo on 10/26/23.
//  Taken from past project, changed questions and added a point system

import SwiftUI

struct QuizView: View {
    @State private var page: Int = 0
    @State var age: String = ""

    @State private var isBack = false   // << reverse flag (not animatable)
    
    var body: some View {
        NavigationStack {
            ZStack {
//                Color.F2E7E8
                Image("questionbg3")
                    .resizable()
                    .frame(width: 394.0, height: 852.0)
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .center) {
                    Group {
                        if page == 0 {
                            PageView(question: "What is your age?", color: .systemBrown)
                            TextField(
                                "", text: $age
                            )
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.center)
                            .font(.title)
                            .padding(6)
                            .frame(width: 130.0)
                        } else if page == 1 {
                            PageView(question: "What are your skin goals?", color: .systemBlue)
                            Text("(choose all that apply)")
                                .font(.title2)
                            Button("More even tone") {
                                self.page = self.page + 1
                            }
                            .modifier(Answer())
                            Button("A healthy glow") {
                                self.page = self.page + 1
                            }
                            .modifier(Answer())
                            Button("Clear skin") {
                                self.page = self.page + 1
                            }
                            .modifier(Answer())
                            Button("Prevent wrinkles") {
                                self.page = self.page + 1
                            }
                            .modifier(Answer())
                        } else if page == 2 {
                            PageView(question: "Which best describes your skin type?", color: .systemBlue)
                            Button("Dry") {
                                self.page = self.page + 1
                            }
                            .modifier(Answer())
                            Button("Normal") {
                                self.page = self.page + 1
                            }
                            .modifier(Answer())
                            Button("Combination") {
                                self.page = self.page + 1
                            }
                            .modifier(Answer())
                            Button("Oily") {
                                self.page = self.page + 1
                            }
                            .modifier(Answer())
                        } else if page == 3 {
                            PageView(question: "Which best describe your skin concerns?", color: .systemBlue)
                            Text("(choose all that apply)")
                                .font(.title2)
                            Button("Dry patches") {
                                self.page = self.page + 1
                            }
                            .modifier(Answer())
                            Button("Oiliness") {
                                self.page = self.page + 1
                            }
                            .modifier(Answer())
                            Button("Fine lines and wrinkles") {
                                self.page = self.page + 1
                            }
                            .modifier(Answer())
                            Button("Redness and irritation") {
                                self.page = self.page + 1
                            }
                            .modifier(Answer())
                            Button("Dark spots or hyperpigmentation") {
                                self.page = self.page + 1
                            }
                            .modifier(Answer())
                        } else if page == 4 {
                            Text("HERE ARE YOUR RESULTS!")
                                .modifier(Question())
                            
                            NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                                Text("VIEW SHOP")
                                    .foregroundStyle(.white.gradient)
                                    .fontWeight(.bold)
                                    .padding()
                                    .background(Color.black)
                                    .cornerRadius(1)
                                    .font(.title3)
                            }
                            .padding()
                        }
                    }
                    .transition(AnyTransition.asymmetric(
                        insertion:.move(edge: isBack ? .leading : .trailing),
                        removal: .move(edge: isBack ? .trailing : .leading))
                    )
                    .animation(.default, value: self.page)   // << animate here by value
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            self.isBack = true
                            self.page = self.page - 1
                        }) {
                            Image(systemName: "arrow.left.circle")
                                .resizable()
                                .frame(width: 40.0, height: 40.0)
                                .foregroundColor(.black)
                        }

                        Spacer()

                        Button(action: {
                            self.isBack = false
                            if page < 4 {
                                self.page = self.page + 1
                            } else {
                                
                            }
                        }) {
                            Image(systemName: "arrow.right.circle")
                                .resizable()
                                .frame(width: 40.0, height: 40.0)
                                .foregroundColor(.black)
                        }
                        Spacer()
                    }
                    .padding()
                }
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

struct PageView: View {
    var question: String
    var color: UIColor
    var body: some View {
        NavigationStack {
            ZStack {
                Spacer()
                VStack {
                    Text(question)
                        .modifier(Question())
                }
                .padding()
                Spacer()
            }
        }
    }
}

struct Answer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .fontWeight(.bold)
            .buttonStyle(.bordered)
            .background(RoundedRectangle(cornerRadius: 4).stroke())            .font(.title3)
            .tint(.white)
            .padding()
    }
}

struct Question: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .font(.largeTitle)
            .foregroundStyle(.black)
            .multilineTextAlignment(.center)
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
