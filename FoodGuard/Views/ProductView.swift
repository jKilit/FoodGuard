// DraggableProductView.swift

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
                } else {
                    Text(productName)
                        .font(.title)
                        .foregroundColor(isProductSafe ? .green : .red)
                        .fontWeight(.bold)
                        .padding()
                    
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
                        .cornerRadius(16)
                        .shadow(radius: 5)
                    }
                }
            }
            .cornerRadius(16)
            .shadow(radius: 5)
            .padding()
            .frame(height: geometry.size.height * 0.8)
            .offset(y: isSheetPresented ? geometry.size.height * 0.2 : geometry.size.height)
            .gesture(DragGesture()
                        .onChanged { value in
                            if value.translation.height < 0 {
                                isSheetPresented = true
                                isScannerActive = false
                            } else {
                                isSheetPresented = false
                                isScannerActive = true
                            }
                        }
                        .onEnded { value in
                            if value.translation.height < 0 {
                                isSheetPresented = true
                                isScannerActive = false
                            } else {
                                isSheetPresented = false
                                isScannerActive = true
                            }
                        })

        }
        .background(Color.black.opacity(0.4).edgesIgnoringSafeArea(.all))
        .navigationBarHidden(true)
    }
}
