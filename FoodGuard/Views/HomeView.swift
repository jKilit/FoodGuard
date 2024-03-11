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

struct AllergiesView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Common Food Allergies")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)

                Text("Food allergies occur when the immune system identifies certain proteins in food as harmful and triggers an allergic reaction. Here are some specific facts about common food allergens:")
                    .foregroundColor(.black)

                Divider()

                // Facts about gluten allergy
                AllergyFact(name: "Gluten", description: "Gluten is a protein found in wheat, barley, and rye. Individuals with celiac disease must strictly avoid gluten to prevent damage to the small intestine.")

                Divider()

                // Facts about lactose intolerance
                AllergyFact(name: "Lactose", description: "Lactose is a sugar found in milk and dairy products. Lactose intolerance occurs when the body lacks the enzyme lactase needed to digest lactose, leading to digestive issues.")

                Divider()

                // Facts about peanut allergy
                AllergyFact(name: "Peanuts", description: "Peanuts are legumes, not true nuts. Peanut allergies can cause severe reactions and, in some cases, anaphylaxis. Cross-contamination is a significant concern.")

                Divider()

                // Facts about tree nut allergy
                AllergyFact(name: "Tree Nuts", description: "Tree nuts include almonds, cashews, walnuts, and more. Tree nut allergies can also lead to severe reactions. Some people are allergic to specific tree nuts, while others react to multiple types.")

                Divider()

                // Facts about shellfish allergy
                AllergyFact(name: "Shellfish", description: "Shellfish allergies can be divided into two types: crustaceans (e.g., shrimp, crab, lobster) and mollusks (e.g., clams, mussels, oysters). Allergic reactions can range from mild to severe.")

                Divider()

                // Facts about soy allergy
                AllergyFact(name: "Soy", description: "Soy is a common ingredient in many processed foods. Soy allergies can cause various symptoms, and it's essential to read food labels carefully.")

                Spacer()
            }
            .padding()
            .navigationBarTitle("Common Food Allergies")
        }
    }
}

struct AllergyFact: View {
    let name: String
    let description: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(name)
                .font(.headline)
                .foregroundColor(.black)

            Text(description)
                .foregroundColor(.gray)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 5))
        .padding(.vertical, 5)
    }
}

struct AllergiesView_Previews: PreviewProvider {
    static var previews: some View {
        AllergiesView()
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

