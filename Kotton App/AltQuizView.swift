//
//  AltQuizView.swift
//  Kotton App
//
//  Created by Elisabeth Manalo on 11/8/23.
//

import SwiftUI

struct AltQuizQuestion: Identifiable {
    let id = UUID()
    let question: String
    let options: [String]
}

struct AltQuizView: View {
    @State private var questions = [
        QuizQuestion(question: "Which material is more sustainable for clothing?", options: ["Cotton", "Polyester", "Wool"]),
        QuizQuestion(question: "What does 'fast fashion' refer to?", options: ["High-quality clothing", "Sustainable clothing", "Mass-produced, low-cost clothing"]),
        QuizQuestion(question: "How can you make your fashion choices more sustainable?", options: ["Buy second-hand clothing", "Buy new clothes every week", "Don't worry about sustainability"])
    ]
    @State private var currentQuestionIndex = 0
    @State private var userAnswers = [Int]()
    @State private var favorites = [AltQuizQuestion]()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("This alt quiz is to show the 'favorite's' page (the heart button) that I'm still figuring out")
                    .padding()
                
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
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                    }
                } else {
                    AltQuizResultView(userAnswers: userAnswers, addToFavorites: addToFavorites)
                }
            }
            .navigationBarTitle("Alt Quiz")
            .navigationBarItems(trailing:
                NavigationLink(destination: FavoritesView(favorites: $favorites)) { // Use NavigationLink
                    Image(systemName: "heart.fill")
                }
            )
        }
    }

    func nextQuestion() {
        currentQuestionIndex += 1
    }
    
    func addToFavorites(question: AltQuizQuestion) {
        favorites.append(question)
    }
}

struct AltQuizResultView: View {
    let userAnswers: [Int]
    let addToFavorites: (AltQuizQuestion) -> Void

    var body: some View {
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
        }

        Button(action: {
            addToFavorites(AltQuizQuestion(question: "Sample Question", options: ["Option A", "Option B", "Option C"]))
        }) {
            Text("Add to Favorites")
        }
    }
}

struct FavoritesView: View {
    @Binding var favorites: [AltQuizQuestion]

    var body: some View {
        List(favorites) { question in
            Text(question.question)
        }
        .navigationBarTitle("Favorites")
    }
}

struct AltQuizView_Previews: PreviewProvider {
    static var previews: some View {
        AltQuizView()
    }
}
