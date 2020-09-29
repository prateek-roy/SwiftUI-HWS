//
//  GuessTheFlag.swift
//  SwiftUI-HWS
//
//  Created by Prateek Roy on 29/09/20.
//

import SwiftUI

struct GuessTheFlag: View {
    @State private var quiz = QuizEngine.getNextQuestion()
    
    @State private var showingScore = false
    @State private var answerStatus = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.blue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                VStack(spacing: 8) {
                    Text("What is the flag for")
                        .font(.title3)
                        .foregroundColor(.white)
                    
                    Text(quiz.question + "?")
                        .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                }
                Spacer()
                ForEach(0 ..< quiz.options.count) { index in
                    Button(action: {
                        check(option: index)
                    }, label: {
                        Text(self.quiz.options[index].flag)
                            .font(.system(size: 100))
                    })
                }
                Spacer()
            }
            
        }
        .alert(isPresented: $showingScore, content: {
            Alert(title: Text(answerStatus), message: Text("Your current score is ???"), dismissButton: .default(Text("continue"), action: {
                quiz = QuizEngine.getNextQuestion()
            }))
        })
    }
    
    
    func check(option index: Int) {
        if self.quiz.question == self.quiz.options[index].countryName {
            answerStatus = "Correct"
        } else {
            answerStatus = "Incorrect"
        }
        
        showingScore = true
    }
    
}

struct GuessTheFlag_Previews: PreviewProvider {
    static var previews: some View {
        GuessTheFlag()
    }
}
