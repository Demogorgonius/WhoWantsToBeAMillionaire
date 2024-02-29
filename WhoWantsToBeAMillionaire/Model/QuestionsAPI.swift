//
//  QuestionsAPI.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Сергей П on 28.02.2024.
//

import Foundation

struct QuestionsAPI {
    let quiz = [
        Question(t: "multiple", d: "medium", c: "General Knowledge", q: "In the Morse code, which letter is indicated by 3 dots? ", cA: "S", iA: ["O", "A", "C"]),
        Question(t: "multiple", d: "medium", c: "General Knowledge", q: "Which of the following carbonated soft drinks were introduced first?", cA: "Dr. Pepper", iA: ["Coca-Cola", "Sprite", "Mountain Dew"]),
        Question(t: "multiple", d: "medium", c: "General Knowledge", q: "Whose greyscale face is on the kappa emoticon on Twitch?", cA: "Josh DeSeno", iA: ["Justin DeSeno", "John DeSeno", "Jimmy DeSeno"]),
        Question(t: "multiple", d: "medium", c: "General Knowledge", q: "Directly between the Washington Monument and the Reflecting Pool is a memorial to which war?", cA: "World War II", iA: ["Vietnam War", "American Civil War", "American Revolutionary War"]),
        Question(t: "multiple", d: "medium", c: "General Knowledge", q: "Linus Pauling, one of the only winners of multiple Nobel Prizes, earned his Nobel Prizes in Chemistry and what?", cA: "Peace", iA: ["Physics", "Economics", "Physiology/Medicine"]),
        Question(t: "multiple", d: "medium", c: "General Knowledge", q: "What does a milliner make and sell?", cA: "Hats", iA: ["Shoes", "Belts", "Shirts"]),
        Question(t: "multiple", d: "medium", c: "General Knowledge", q: "What is the defining characteristic of someone who is described as hirsute?", cA: "Hairy", iA: ["Rude", "Funny", "Tall"]),
        Question(t: "multiple", d: "medium", c: "General Knowledge", q: "What country saw a world record 315 million voters turn out for elections on May 20, 1991?", cA: "India", iA: ["United States of America", "Soviet Union", "Poland"]),
        Question(t: "multiple", d: "medium", c: "General Knowledge", q: "A statue of Charles Darwin sits in what London museum?", cA: "Natural History Museum", iA: ["Tate", "British Museum", "Science Museum"]),
        Question(t: "multiple", d: "medium", c: "General Knowledge", q: "Which country drives on the left side of the road?", cA: "Japan", iA: ["Germany", "Russia", "China"]),
        Question(t: "multiple", d: "medium", c: "General Knowledge", q: "What alcoholic drink is mainly made from juniper berries?", cA: "Gin", iA: ["Vodka", "Rum", "Tequila"]),
        Question(t: "multiple", d: "medium", c: "General Knowledge", q: "Which of these companies does NOT manufacture automobiles?", cA: "Ducati", iA: ["Nissan", "GMC", "Fiat"]),
        Question(t: "multiple", d: "medium", c: "General Knowledge", q: "Where does water from Poland Spring water bottles come from?", cA: "Maine, United States", iA: ["Hesse, Germany", "Masovia, Poland", "Bavaria, Poland"]),
        Question(t: "multiple", d: "medium", c: "General Knowledge", q: "What is the star sign of someone born on Valentines day?", cA: "Aquarius", iA: ["Pisces", "Capricorn", "Scorpio"]),
        Question(t: "multiple", d: "medium", c: "General Knowledge", q: "Earl Grey tea is black tea flavoured with what?", cA: "Bergamot oil", iA: ["Lavender", "Vanilla", "Honey"])
    ]
    
    func fetchData() -> [Question] {

            return quiz

        }

}
