//
//  AllergiesView.swift
//  FoodGuard
//
//  Created by Edin Nasic on 2024-03-11.
//

import Foundation
import SwiftUI

struct AllergiesView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Common Food Allergies")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)

                Text("Food allergies occur when the immune system identifies certain proteins in food as harmful and triggers an allergic reaction. Here are some specific facts about common food allergens:")
                    .foregroundColor(.black)

                Divider()

                // Facts about gluten allergy
                AllergyFact(name: "Gluten", description: "Gluten is a protein found in wheat, barley, and rye. Individuals with celiac disease must strictly avoid gluten to prevent damage to the small intestine.")

                Divider()

                // Facts about lactose intolerance
                AllergyFact(name: "Lactose", description: "Lactose is a sugar found in milk and dairy products. Lactose intolerance occurs when the body lacks the enzyme lactase needed to digest lactose, leading to digestive issues.")

                Divider()

                // Facts about peanut allergy
                AllergyFact(name: "Peanuts", description: "Peanuts are legumes, not true nuts. Peanut allergies can cause severe reactions and, in some cases, anaphylaxis. Cross-contamination is a significant concern.")

                Divider()

                // Facts about tree nut allergy
                AllergyFact(name: "Tree Nuts", description: "Tree nuts include almonds, cashews, walnuts, and more. Tree nut allergies can also lead to severe reactions. Some people are allergic to specific tree nuts, while others react to multiple types.")

                Divider()

                // Facts about shellfish allergy
                AllergyFact(name: "Shellfish", description: "Shellfish allergies can be divided into two types: crustaceans (e.g., shrimp, crab, lobster) and mollusks (e.g., clams, mussels, oysters). Allergic reactions can range from mild to severe.")

                Divider()

                // Facts about soy allergy
                AllergyFact(name: "Soy", description: "Soy is a common ingredient in many processed foods. Soy allergies can cause various symptoms, and it's essential to read food labels carefully.")

                Divider()
                
            }
            .padding()
            .navigationBarTitle("Common Food Allergies")
        }
    }
}

struct AllergyFact: View {
    let name: String
    let description: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(name)
                .font(.headline)
                .foregroundColor(.blue)

            Text(description)
                .foregroundColor(.gray)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 5))
        .padding(.vertical, 5)
    }
}

