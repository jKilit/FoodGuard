import SwiftUI

struct ProductView: View {
    @State private var preferencesModel = PreferencesModel()
    @State private var productModel = ProductModel()
    
    let productName: String
    let ingredients: [String]
    let ingredientsTags: [String]
    
    var body: some View {
        let isProductSafe: Bool = productModel.compareIngredients(ingredients, ingredientTags: ingredientsTags, productName: productName)
        
        VStack {
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
                Text("This product does not match")
                    .foregroundColor(.red)
                Text("your preferences!")
                    .foregroundColor(.red)
                    .padding()
                
                // Red cross image
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.red)
                // Display matched products
                
                List {
                    Section(header: Text("Alert-triggering ingredients:").font(.title3).foregroundColor(.orange)) {
                        ForEach(productModel.matchedProducts, id: \.productName) { matchedProduct in
                            VStack(alignment: .leading) {
                                
                                // Display alert-triggering ingredients
                                ForEach(matchedProduct.alertTriggeringIngredients.sorted(), id: \.self) { alertTriggeringIngredient in
                                    Text(alertTriggeringIngredient)
                                        .padding(.vertical, 4)
                                }
                                
                            }
                            .padding(.vertical, 8)
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .frame(height: UIScreen.main.bounds.height / 2) // Half of the screen height
                .cornerRadius(16)
                .shadow(radius: 5)
            }
        }
        .cornerRadius(16)
        .shadow(radius: 5)
        .padding()
        .navigationTitle("Product Details")
    }
}
