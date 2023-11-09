//
//  QuizView.swift
//  Kotton App
//
//  Created by Elisabeth Manalo on 10/26/23.
//  Taken from past project, changed questions and added a point system

import SwiftUI

struct QuizQuestion: Identifiable {
    let id = UUID()
    let question: String
    let options: [String]
}

struct QuizView: View {
    @State private var questions = [
        QuizQuestion(question: "Which material is more sustainable for clothing?", options: ["Cotton", "Polyester", "Wool"]),
        QuizQuestion(question: "What does 'fast fashion' refer to?", options: ["High-quality clothing", "Sustainable clothing", "Mass-produced, low-cost clothing"]),
        QuizQuestion(question: "How can you make your fashion choices more sustainable?", options: ["Buy second-hand clothing", "Buy new clothes every week", "Don't worry about sustainability"])
    ]
    @State private var currentQuestionIndex = 0
    @State private var userAnswers = [Int]()
    
    var body: some View {
        VStack {
            if currentQuestionIndex < questions.count {
                Text(questions[currentQuestionIndex].question)
                    .font(.headline)
                    .padding()
                
                ForEach(0..<questions[currentQuestionIndex].options.count, id: \.self) { index in
                    Button(action: {
                        userAnswers.append(index)
                        nextQuestion()
                    }) {
                        Text(questions[currentQuestionIndex].options[index])
                            .padding()
                            .tint(.white)
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .border(Color.black)
                            .cornerRadius(4)
                            .background(RoundedRectangle(cornerRadius: 4).stroke())
                    }
                    .padding(.horizontal)
                }
            } else {
                QuizResultView(userAnswers: userAnswers)
            }
        }
    }
    
    func nextQuestion() {
        currentQuestionIndex += 1
    }
}

struct QuizResultView: View {
    let userAnswers: [Int]
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Quiz Results")
                    .font(.title)
                    .padding()
                
                Text("Your answers:")
                    .font(.headline)
                    .padding()
                
                ForEach(0..<userAnswers.count, id: \.self) { index in
                    Text("Question \(index + 1): \(userAnswers[index] + 1)")
                }
                
                NavigationLink(destination: ShopView()) {
                    Text("GO TO SHOP")
                        .padding()
                        .background(.black)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .border(Color.black)
                        .cornerRadius(4)
                        .background(RoundedRectangle(cornerRadius: 4).stroke())
                }
                
                Text("or take the")
                NavigationLink(destination: AltQuizView()) {
                    Text("ALT QUIZ")
                        .padding()
                        .background(.black)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .border(Color.black)
                        .cornerRadius(4)
                        .background(RoundedRectangle(cornerRadius: 4).stroke())
                }
            }
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}



//struct QuizView: View {
//    @State private var page: Int = 0
//    @State var age: String = ""
//
//    @State private var isBack = false   // << reverse flag (not animatable)
//
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                VStack(alignment: .center) {
//                    Group {
//                        if page == 0 {
//                            PageView(question: "How many liters of water does it take to make 1 pair of jeans?", color: .systemBrown)
//                            TextField(
//                                "", text: $age
//                            )
//                            .textFieldStyle(.roundedBorder)
//                            .multilineTextAlignment(.center)
//                            .font(.title)
//                            .padding(6)
//                            .frame(width: 130.0)
//                        } else if page == 1 {
//                            PageView(question: "What percentage of total global greenhouse gas emissions are produced by the fashion industry?", color: .systemBlue)
//                            Text("(choose all that apply)")
//                                .font(.title2)
//                            Button("Less than 1%") {
//                                self.page = self.page + 1
//                            }
//                            .modifier(Answer())
//                            // right answer
//                            Button("4%") {
//                                self.page = self.page + 1
//                            }
//                            .modifier(Answer())
//                            Button("10%") {
//                                self.page = self.page + 1
//                            }
//                            .modifier(Answer())
//                            Button("15%") {
//                                self.page = self.page + 1
//                            }
//                            .modifier(Answer())
//                        } else if page == 2 {
//                            PageView(question: "The fashion industry contributes to environmental degradation in which of the following ways?", color: .systemBlue)
//                            Button("Deforestation") {
//                                self.page = self.page + 1
//                            }
//                            .modifier(Answer())
//                            Button("Desertification and degradation of soil") {
//                                self.page = self.page + 1
//                            }
//                            .modifier(Answer())
//                            Button("Loss of biodiversity") {
//                                self.page = self.page + 1
//                            }
//                            .modifier(Answer())
//                            // right answer
//                            Button("All of the above") {
//                                self.page = self.page + 1
//                            }
//                            .modifier(Answer())
//                        } else if page == 3 {
//                            PageView(question: "What does greenwashing in fashion refer to?", color: .systemBlue)
//                            Button("Washing clothing in environmentally friendly ways") {
//                                self.page = self.page + 1
//                            }
//                            .modifier(Answer())
//                            // right answer
//                            Button("Claims of environmental sustainability by a brand that are false or misleading") {
//                                self.page = self.page + 1
//                            }
//                            .modifier(Answer())
//                            Button("Lying to people around you that something you bought was secondhand when it wasn’ts") {
//                                self.page = self.page + 1
//                            }
//                            .modifier(Answer())
//                            Button("Using natural fabric dyes") {
//                                self.page = self.page + 1
//                            }
//                            .modifier(Answer())
//                        } else if page == 4 {
//                            Text("YOU GOT 100% CORRECT!")
//                                .modifier(Question())
//
//                            NavigationLink(destination: ShopView()) {
//                                Text("VIEW SHOP")
//                                    .foregroundStyle(.white.gradient)
//                                    .fontWeight(.bold)
//                                    .padding()
//                                    .background(Color.black)
//                                    .cornerRadius(1)
//                                    .font(.title3)
//                            }
//                            .padding()
//                        }
//                    }
//                    .transition(AnyTransition.asymmetric(
//                        insertion:.move(edge: isBack ? .leading : .trailing),
//                        removal: .move(edge: isBack ? .trailing : .leading))
//                    )
//                    .animation(.default, value: self.page)   // << animate here by value
//
//                    HStack {
//                        Spacer()
//                        Button(action: {
//                            self.isBack = true
//                            self.page = self.page - 1
//                        }) {
//                            Image(systemName: "arrow.left.circle")
//                                .resizable()
//                                .frame(width: 40.0, height: 40.0)
//                                .foregroundColor(.black)
//                        }
//
//                        Spacer()
//
//                        Button(action: {
//                            self.isBack = false
//                            if page < 4 {
//                                self.page = self.page + 1
//                            } else {
//
//                            }
//                        }) {
//                            Image(systemName: "arrow.right.circle")
//                                .resizable()
//                                .frame(width: 40.0, height: 40.0)
//                                .foregroundColor(.black)
//                        }
//                        Spacer()
//                    }
//                    .padding()
//                }
//            }
//        }
//        .toolbar(.hidden, for: .navigationBar)
//    }
//}
//
//struct PageView: View {
//    var question: String
//    var color: UIColor
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                Spacer()
//                VStack {
//                    Text(question)
//                        .modifier(Question())
//                }
//                .padding()
//                Spacer()
//            }
//        }
//    }
//}
//
//struct Answer: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .foregroundColor(.black)
//            .fontWeight(.bold)
//            .buttonStyle(.bordered)
//            .background(RoundedRectangle(cornerRadius: 4).stroke())            .font(.title3)
//            .tint(.white)
//            .padding()
//    }
//}
//
//struct Question: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .padding()
//            .font(.largeTitle)
//            .foregroundStyle(.black)
//            .multilineTextAlignment(.center)
//    }
//}
//
