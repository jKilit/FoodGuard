//
//  IngredientsToAvoidView.swift
//  FoodGuard
//
//  Created by Edin Nasic on 2024-03-11.
//

import Foundation
import SwiftUI

struct IngredientsToAvoidView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Ingredients to Consider Avoiding")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)

                Text("These are ingredients found in food that we eat everyday, that you might concider avoiding.")
                    .foregroundColor(.black)

                Divider()

                IngredientFact(name: "Palm Oil", description: "Palm oil is a widely used vegetable oil found in many processed foods and household products. It is associated with environmental concerns, including deforestation.")

                Divider()
                
                IngredientFact(name: "Highly Refined Grains", description: "Highly refined grains, such as white flour, have most nutrients removed. They have lower nutritional value compared to whole grains.")
                
                Divider()

                IngredientFact(name: "Caffeine", description: "Caffeine is a natural stimulant found in coffee, tea, and various energy drinks. Excessive consumption may lead to negative effects such as insomnia and jitteriness.")

                Divider()

                IngredientFact(name: "High-Fructose Corn Syrup", description: "High-fructose corn syrup is a common sweetener in processed foods. Excessive consumption may contribute to health issues if consumed excessively.")

                Divider()

                IngredientFact(name: "Artificial Sweeteners", description: "Artificial sweeteners are sugar substitutes used in various diet products. They may have controversial health effects, and concerns exist about potential health risks. You can find some of them in the E-additives section")

                Divider()
                
                IngredientFact(name: "Packaged Gelatine", description: "Gelatin desserts are rich with artificial flavorings and sugar that can be harmful to our bodies. They also have artificial colors, which are known carcinogens, and a chemical called Red #40—an ingredient linked to hyperactivity—which has actually caused European countries to issue a warning label on the food saying, “May have an adverse effect on activity and attention in children.”")

                Divider()
                
                IngredientFact(name: "Highly Processed Vegetable Oils", description: "Highly processed vegetable oils, such as soybean oil and corn oil, are commonly used in cooking and processed foods. They may contribute to inflammation and health issues.")
                
                Divider()
                
                IngredientFact(name: "Pork", description: "Pork is meat derived from pigs. Many consider pork to be one of the less healthy meat options. It is high in saturated fats and cholesterol, which may contribute to heart disease and other health issues. Additionally, there are concerns about the use of antibiotics and additives in pork production. If possible, choosing leaner cuts and organic, sustainably sourced pork may be a better option for those who include pork in their diet. But there certainly are healthier protein sources")
            }
            .padding()
            .navigationBarTitle("Ingredients to Avoid")
        }
    }
}

struct IngredientFact: View {
    let name: String
    let description: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(name)
                .font(.headline)
                .foregroundColor(.red)

            Text(description)
                .foregroundColor(.gray)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 5))
        .padding(.vertical, 5)
    }
}

