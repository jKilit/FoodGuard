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
                
                
                NavigationLink(destination: SomethingElseView()) {
                    HomeBox(title: "Something Else", color: .blue)
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

struct FunFactsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Fun Facts")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding(.top, 20)

                Image("1") // Replace with an image related to Fun Facts
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(16)
                    .shadow(radius: 5)

                Text("Did you know?")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .padding(.top, 10)

                // Fun facts about allergies and e-additives
                VStack(alignment: .leading, spacing: 10) {
                    Text("1. More than 170 foods have been reported to cause allergic reactions.")
                        .foregroundColor(.black)

                    Text("2. E-additives are substances added to food to preserve flavor or enhance its taste and appearance.")
                        .foregroundColor(.black)

                    Text("3. Apples contain natural antioxidants that may help reduce the risk of chronic diseases.")
                        .foregroundColor(.black)
                }
                .padding()

                // Additional details or information about Fun Facts
                Text("Explore more about Fun Facts and discover interesting information.")
                    .foregroundColor(.black)

                Spacer()
            }
            .padding()
        }
        .navigationBarTitle("Fun Facts")
    }
}


struct EAdditivesView: View {
    var body: some View {
        Text("information about E-additives")
            .padding()
            .navigationBarTitle("E-additives")
    }
}

struct AllergiesView: View {
    var body: some View {
        Text("information about Allergies")
            .padding()
            .navigationBarTitle("Allergies")
    }
}

struct SomethingElseView: View {
    var body: some View {
        Text("information about Something Else")
            .padding()
            .navigationBarTitle("Something Else")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

