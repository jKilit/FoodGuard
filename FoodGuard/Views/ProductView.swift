import SwiftUI

struct ProductView: View {
    @State private var preferencesModel = PreferencesModel()
    @State private var productModel = ProductModel()

    let productName: String


    var body: some View {
        VStack {
            let ingredients = Array(preferencesModel.selectedIngredients)
            let isProductSafe:Bool = productModel.compareIngredients(ingredients)

            Image("1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .padding()

            Text("Product name: \(productName)")
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

                // Red cross image
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.red)
            }

            // Form with ingredients
            Form {
                Section(header: Text("Ingredients").font(.headline).foregroundColor(isProductSafe ? .green : .red)) {
                    ForEach(ingredients, id: \.self) { ingredient in
                        Text(ingredient)
                    }
                }
            }

            Spacer()
        }
        .cornerRadius(16)
        .shadow(radius: 5)
        .padding()
        .navigationTitle("Product Details")
    }
}
