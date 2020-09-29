//
//  FlagsListData.swift
//  SwiftUI-HWS
//
//  Created by Prateek Roy on 29/09/20.
//

import Foundation

struct FlagData: Identifiable {
    let id: UUID
    let countryName: String
    let flag: String
}


let flagsListData = [
    FlagData(id: UUID(), countryName: "India", flag: "🇮🇳"),
    FlagData(id: UUID(), countryName: "France", flag: "🇫🇷"),
    FlagData(id: UUID(), countryName: "Germany", flag: "🇩🇪"),
    FlagData(id: UUID(), countryName: "Iran", flag: "🇮🇷"),
    FlagData(id: UUID(), countryName: "UAE", flag: "🇦🇪"),
    FlagData(id: UUID(), countryName: "Kenya", flag: "🇰🇪"),
    FlagData(id: UUID(), countryName: "Australia", flag: "🇦🇺"),
    FlagData(id: UUID(), countryName: "USA", flag: "🇺🇸"),
    FlagData(id: UUID(), countryName: "England", flag: "🏴󠁧󠁢󠁥󠁮󠁧󠁿"),
    FlagData(id: UUID(), countryName: "Jordan", flag: "🇯🇴")
]

let flagsList = ["🇮🇳", "🇫🇷", "🇩🇪", "🇮🇷", "🇦🇪", "🇰🇪", "🇦🇺", "🇺🇸", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇯🇴"]
let countriesList = ["India", "France", "Germany", "Iran", "UAE", "Kenya", "Australia", "USA", "England", "Jordan"]

class QuizEngine {
    
    class func getNextQuestion() -> (question: String, options: [FlagData]) {
        let correctAnswerIndex = Int.random(in: 0 ..< flagsListData.count)
        
        let option1 = QuizEngine.genrateWrongOption([correctAnswerIndex])
        let option2 = QuizEngine.genrateWrongOption([correctAnswerIndex, option1])
        
        let optionsList = [QuizEngine.getFlagData(at: correctAnswerIndex), QuizEngine.getFlagData(at: option1), QuizEngine.getFlagData(at: option2)]
        return (countriesList[correctAnswerIndex], optionsList.shuffled())
        
    }
    
    private class func genrateWrongOption(_ selectedNumbers: [Int]) -> Int {
        let allOptions = Array(0 ..< flagsListData.count)
        var filteredOptions = allOptions.filter {
            return !selectedNumbers.contains($0)
        }
        
        filteredOptions.shuffle()
        return filteredOptions.last ?? 0
    }
    
    private class func getFlagData(at index: Int) -> FlagData {
        return flagsListData[index]
    }
}
