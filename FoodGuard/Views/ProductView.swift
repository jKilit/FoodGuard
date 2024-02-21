import SwiftUI


struct ProductView: View {
    @State private var preferencesModel = PreferencesModel()
    @State private var productModel = ProductModel()

    let productName: String
    let ingredients: [String]
    let ingredientsTags: [String]

    var body: some View {
        let isProductSafe: Bool = productModel.compareIngredients(ingredients, productName: productName)
        VStack {
            let preferences = Array(preferencesModel.selectedIngredients)

            Text(productName)
                .font(.title)
                .foregroundColor(isProductSafe ? .green : .red)
                .fontWeight(.bold)
                .padding()

            if isProductSafe {
                // Green background for safe products
                Text("This product is safe!")
                    .foregroundColor(.green)
                    .padding()

                // Checkmark image
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.green)
            } else {
                // Red background for products with ingredients not in preferences
                Text("This product contains ingredients not in your preferences!")
                    .foregroundColor(.red)
                    .padding()

              /* // Display matched products
                if !productModel.matchedProducts.isEmpty {
                    Text("Matched Products:")
                        .font(.headline)
                        .padding(.top, 10)
                    
                    ForEach(productModel.matchedProducts, id: \.self) { matchedProduct in
                        Text(matchedProduct)
                    }
                }*/

                // Red cross image
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.red)
            }

            // Form with preferences
            List {
                Section(header: Text("Preferences (Ingredients)").font(.title3).foregroundColor(isProductSafe ? .green : .red)) {
                    ForEach(preferences, id: \.self) { ingredient in
                        Text(ingredient)
                            .padding(.vertical, 8)
                    }
                }

                Section(header: Text("Ingredients (for testing)").font(.title3).foregroundColor(isProductSafe ? .green : .red)) {
                    ForEach(ingredients, id: \.self) { ingredient in
                        // Remove "en:" prefix from each ingredient
                        let cleanedIngredient = ingredient.replacingOccurrences(of: "en:", with: "")

                        Text(cleanedIngredient)
                            .padding(.vertical, 8)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .frame(height: UIScreen.main.bounds.height / 2) // Half of the screen height
            .cornerRadius(16)
            .shadow(radius: 5)
        }
        .cornerRadius(16)
        .shadow(radius: 5)
        .padding()
        .navigationTitle("Product Details")
    }
}
