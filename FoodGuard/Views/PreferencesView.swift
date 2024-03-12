//
//  PreferencesView.swift
//  FoodGuard
//
//  Created by Edvin Mujanovic on 2024-02-13.
//


import SwiftUI
struct PreferencesView: View {
    @State var preferencesModel: PreferencesModel

    let ingredients = Ingredient.allCases
    let emojis = ["🥛", "🍬", "🥚", "🥜", "🌾", "🌱", "🐟", "🥩", "🌴", "🧪"]

    var body: some View {
        ScrollView {
            VStack {
                Image("1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .padding(.bottom, 10)

                Text("I don't want to consume:")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)

                LazyVStack(alignment: .leading, spacing: 10) {
                    ForEach(ingredients.indices, id: \.self) { index in
                        Toggle(isOn: Binding(
                            get: { preferencesModel.selectedIngredients.contains(ingredients[index]) },
                            set: { _ in preferencesModel.toggleIngredient(ingredients[index]) }
                        )) {
                            Text("\(emojis[index]) \(ingredients[index].displayName)")
                        }
                    }
                }
                .navigationTitle("Preferences")
                .padding()

            }
        }
    }
}
