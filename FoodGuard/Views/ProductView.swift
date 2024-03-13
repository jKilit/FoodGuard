import SwiftUI

struct DraggableProductView: View {
    @State private var preferencesModel = PreferencesModel()
    @State private var productModel = ProductModel()
    
    let productName: String
    let ingredients: [String]
    let ingredientsTags: [String]
    @Binding var isSheetPresented: Bool
    @Binding var isScannerActive: Bool
    
    var body: some View {
        let isProductSafe: Bool = productModel.compareIngredients(ingredients, ingredientTags: ingredientsTags, productName: productName)
        
        GeometryReader { geometry in
            VStack {
                if productName == "N/A" {
                    Text("Product not found. Go back and try again")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(12)
                } else {
                    VStack {
                        Text(productName)
                            .font(.title)
                            .foregroundColor(isProductSafe ? .green : .red)
                            .fontWeight(.bold)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                        
                        if isProductSafe {
                            Text("This product is safe!")
                                .foregroundColor(.green)
                                .padding()
                            
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.green)
                        } else {
                            Text("This product does not match your preferences!")
                                .foregroundColor(.red)
                                .padding()
                            
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.red)
                            
                            ScrollView {
                                MatchedProductsListView(alertTriggeringIngredients: productModel.matchedProducts.flatMap { $0.alertTriggeringIngredients })
                            }
                            .frame(height: UIScreen.main.bounds.height / 2)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(16)
                            .shadow(radius: 5)
                        }
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 32)
                    .cornerRadius(16)
                    .shadow(radius: 5)
                    .background(Color.white)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        }
    }
}

struct MatchedProductsListView: View {
    let alertTriggeringIngredients: [Ingredient]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Alert Triggering Ingredients:")
                .font(.headline)
                .foregroundColor(.red)
                .padding(.bottom, 4)
            
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(alertTriggeringIngredients.sorted(), id: \.self) { alertTriggeringIngredient in
                        let displayName = self.displayNameForIngredient(alertTriggeringIngredient)
                        Text(displayName)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .background(Color.white)
                    }
                }
            .frame(maxHeight: 50) // Set maximum height for the VStack inside ScrollView


        }
    }
    
    func displayNameForIngredient(_ ingredient: Ingredient) -> String {
        switch ingredient {
        case .eAdditives:
            return "E-Additives"
        case .palmOil:
            return "Palm Oil"
        case .animalProducts:
            return "Animal Products"
        default:
            return ingredient.rawValue
        }
    }
}
