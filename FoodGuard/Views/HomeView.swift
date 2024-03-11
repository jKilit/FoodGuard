import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("Welcome to FoodGuard!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(.top, 20)
                    
                    Spacer()
                    Image("1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .cornerRadius(16)
                    
                    Spacer()
                }
                
                
                NavigationLink(destination: FunFactsView()) {
                    HomeBox(title: "Fun Facts", color: .blue)
                }
                
                
                NavigationLink(destination: EAdditivesView()) {
                    HomeBox(title: "E-additives", color: .blue)
                }
                
                
                NavigationLink(destination: AllergiesView()) {
                    HomeBox(title: "Allergies", color: .blue)
                }
                
                
                NavigationLink(destination: IngredientsToAvoidView()) {
                    HomeBox(title: "Ingredients to avoid", color: .blue)
                }
                
                Spacer()
            }
            .padding()
        }
        
        HStack {
            Spacer()
            Text("© 2024 Doboj x Kellef. All rights reserved.")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding()
        }
    }
      
}

struct HomeBox: View {
    let title: String
    let color: Color
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
        .background(color)
        .cornerRadius(16)
        .shadow(radius: 5)
    }
}


