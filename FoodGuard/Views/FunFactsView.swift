//
//  FunFactsView.swift
//  FoodGuard
//
//  Created by Edin Nasic on 2024-03-11.
//

import Foundation
import SwiftUI

struct FunFactsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Fun Facts")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding(.top, 20)

                Text("Did you know?")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .padding(.top, 10)

                VStack(alignment: .leading, spacing: 10) {
                    Text("1. More than 170 foods have been reported to cause allergic reactions.")
                        .foregroundColor(.black)

                    Text("2. E-additives are substances added to food to preserve flavor or enhance its taste and appearance.")
                        .foregroundColor(.black)

                    Text("5. Certain foods may have negative effects on health, such as high-sugar snacks contributing to obesity and diabetes.")
                        .foregroundColor(.black)

                    Text("6. About 1-2% of the global population suffers from celiac disease, an autoimmune disorder triggered by gluten consumption.")
                        .foregroundColor(.black)

                    Text("7. Processed foods often contain high levels of sodium, which may lead to hypertension and cardiovascular issues.")
                        .foregroundColor(.black)
                    
                    Text("8. In the Home Meny, you can find facts about allergies, a list of e-additives and their concerns, and a list of other ingridients to concider avoiding.")
                        .foregroundColor(.green)
                        .bold()
                    
                }
            }
            .padding()
        }
        .navigationBarTitle("Fun Facts")
    }
}

