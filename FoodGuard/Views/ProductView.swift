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
                            Text("This product does not match")
                                .foregroundColor(.red)
                            Text("your preferences!")
                                .foregroundColor(.red)
                                .padding()

                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.red)

                            List {
                                Section(header: Text("Alert-triggering ingredients:").font(.title3).foregroundColor(.orange)) {
                                    ForEach(productModel.matchedProducts, id: \.productName) { matchedProduct in
                                        VStack(alignment: .leading) {
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
                            .frame(height: UIScreen.main.bounds.height / 2)
                            .shadow(radius: 5)
                            .background(Color.white)
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
