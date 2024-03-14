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
                    HomeBox(title: "Fun Facts", backgroundImageName: "3")
                }
                
                NavigationLink(destination: EAdditivesView()) {
                    HomeBox(title: "E-additives", backgroundImageName: "4")
                }
                
                NavigationLink(destination: AllergiesView()) {
                    HomeBox(title: "Allergies", backgroundImageName: "2")
                }
                
                NavigationLink(destination: IngredientsToAvoidView()) {
                    HomeBox(title: "Ingredients to avoid", backgroundImageName: "5")
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
    let backgroundImageName: String 
    
    var body: some View {
        ZStack {
            Image(backgroundImageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: 80)
                .cornerRadius(16)
                .shadow(radius: 5)
            
            Color.black.opacity(0.6)
                .frame(maxWidth: .infinity, maxHeight: 100)
                .cornerRadius(16)
            
            VStack {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: 100)
            .background(Color.clear)
            .cornerRadius(16)
        }
    }
}
