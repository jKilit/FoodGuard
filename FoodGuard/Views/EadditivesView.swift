import SwiftUI
import Foundation

struct EAdditivesView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("E-additives, or food additives, are substances added to food to preserve flavor or enhance its taste and appearance. While many are safe, some additives may raise concerns due to their origins or potential health effects.")
                        .foregroundColor(.black)
                    
                    Divider()
                    
                    Text("E-additives to Consider Avoiding:")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(.top, 10)
                    
                    SearchBar(text: $searchText)
                        .padding(.top, 5)
                    
                    ForEach(eAdditives.filter {
                        searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText)
                    }) { eAdditive in
                        EAdditiveRow(eAdditive: eAdditive)
                    }
                    
                    Spacer()
                }
                .padding()
                .navigationBarTitle("E-additives")
            }
        }
    }
}

struct EAdditiveRow: View {
    let eAdditive: EAdditive
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(eAdditive.name): \(eAdditive.description)")
                .foregroundColor(.black)
            
            Text("Concerns: \(eAdditive.reason)")
                .foregroundColor(.red)
        }
    }
}

struct EAdditivesView_Previews: PreviewProvider {
    static var previews: some View {
        EAdditivesView()
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if !text.isEmpty {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
        }
        .padding(.horizontal, 10)
    }
}

struct EAdditive: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let reason: String
}

let eAdditives: [EAdditive] = [
    EAdditive(name: "E621", description: "Monosodium Glutamate (MSG)", reason: "May cause headaches and allergic reactions in some individuals."),
    EAdditive(name: "E951", description: "Aspartame", reason: "Controversial sweetener; concerns about potential health effects."),
    EAdditive(name: "E133", description: "Brilliant Blue FCF", reason: "May cause allergic reactions; banned in some countries."),
    EAdditive(name: "E320", description: "Butylated Hydroxyanisole (BHA)", reason: "May be a human carcinogen; concerns about long-term use."),
    EAdditive(name: "E951", description: "Sodium Benzoate", reason: "May react with vitamin C to form benzene, a known carcinogen."),
    EAdditive(name: "E211", description: "Sodium Benzoate", reason: "May react with vitamin C to form benzene, a known carcinogen."),
    EAdditive(name: "E102", description: "Tartrazine", reason: "Linked to hyperactivity in children; may cause allergic reactions."),
    EAdditive(name: "E104", description: "Quinoline Yellow", reason: "May cause allergic reactions."),
    EAdditive(name: "E129", description: "Allura Red AC", reason: "May cause allergic reactions; concerns about its safety."),
    EAdditive(name: "E110", description: "Sunset Yellow FCF", reason: "May cause allergic reactions; concerns about its safety."),
    EAdditive(name: "E124", description: "Ponceau 4R", reason: "May cause allergic reactions; concerns about its safety."),
    EAdditive(name: "E210", description: "Benzoic Acid", reason: "Concerns about its link to hyperactivity and allergic reactions."),
    EAdditive(name: "E951", description: "Sodium Benzoate", reason: "May react with vitamin C to form benzene, a known carcinogen."),
    EAdditive(name: "E250", description: "Sodium Nitrite", reason: "Used as a preservative in cured meats; concerns about potential health effects."),
    EAdditive(name: "E120", description: "Cochineal, Carminic Acid", reason: "Derived from crushed cochineal insects; may cause allergic reactions in some individuals."),
    EAdditive(name: "E631", description: "Disodium Inosinate", reason: "Flavor enhancer; may be sourced from animals."),
    EAdditive(name: "E634", description: "Calcium 5'-Ribonucleotides", reason: "Flavor enhancer; may cause reactions in sensitive individuals."),
    EAdditive(name: "E635", description: "Disodium 5'-Ribonucleotides", reason: "Flavor enhancer; may cause reactions in sensitive individuals."),
    EAdditive(name: "E636", description: "Maltol", reason: "Flavor enhancer; concerns about its safety."),
    EAdditive(name: "E637", description: "Ethyl Maltol", reason: "Flavor enhancer; concerns about its safety."),
    EAdditive(name: "E639", description: "Sodium Thiosulfate", reason: "Used as a preservative; concerns about its safety."),
    EAdditive(name: "E650", description: "Zinc Acetate", reason: "Used as a preservative; concerns about its safety."),
    EAdditive(name: "E900", description: "Dimethylpolysiloxane", reason: "Anti-foaming agent; concerns about its safety."),
    EAdditive(name: "E901", description: "Beeswax", reason: "Glazing agent; may not be suitable for vegans."),
    EAdditive(name: "E902", description: "Candelilla Wax", reason: "Glazing agent; may not be suitable for vegans."),
    EAdditive(name: "E903", description: "Carnauba Wax", reason: "Glazing agent; may not be suitable for vegans."),
    EAdditive(name: "E904", description: "Shellac", reason: "Glazing agent; derived from the lac insect."),
    EAdditive(name: "E905a", description: "Mineral Oil", reason: "Glazing agent; concerns about its safety."),
    EAdditive(name: "E905b", description: "Petrolatum", reason: "Glazing agent; concerns about its safety."),
    EAdditive(name: "E912", description: "Montan Acid Esters", reason: "Glazing agent; concerns about its safety."),
    EAdditive(name: "E914", description: "Oxidized Polyethylene Wax", reason: "Glazing agent; concerns about its safety."),
    EAdditive(name: "E920", description: "L-Cysteine", reason: "Flour treatment agent; may be derived from human hair or feathers."),
    EAdditive(name: "E926", description: "Chlorine", reason: "Used as a flour treatment agent; concerns about its safety."),
    EAdditive(name: "E939", description: "Helium", reason: "Propellant gas; concerns about its safety."),
    EAdditive(name: "E941", description: "Nitrogen", reason: "Propellant gas; concerns about its safety."),
    EAdditive(name: "E160b", description: "Annatto", reason: "May cause allergic reactions."),
    EAdditive(name: "E200", description: "Sorbic Acid", reason: "May cause non-allergic sensitivity."),
    EAdditive(name: "E202", description: "Potassium Sorbate", reason: "May cause non-allergic sensitivity."),
    EAdditive(name: "E203", description: "Calcium Sorbate", reason: "May cause non-allergic sensitivity."),
    EAdditive(name: "E212", description: "Potassium Benzoate", reason: "May cause non-allergic sensitivity."),
    EAdditive(name: "E213", description: "Calcium Benzoate", reason: "May cause non-allergic sensitivity."),
    EAdditive(name: "E214", description: "Ethyl 4-hydroxybenzoate", reason: "May cause non-allergic sensitivity."),
    EAdditive(name: "E215", description: "Ethyl 4-hydroxybenzoate sodium salt", reason: "May cause non-allergic sensitivity."),
    EAdditive(name: "E216", description: "Propyl 4-hydroxybenzoate", reason: "May cause non-allergic sensitivity."),
    EAdditive(name: "E217", description: "Propyl 4-hydroxybenzoate sodium salt", reason: "May cause non-allergic sensitivity."),
    EAdditive(name: "E218", description: "Methyl 4-hydroxybenzoate", reason: "May cause non-allergic sensitivity."),
    EAdditive(name: "E219", description: "Methyl 4-hydroxybenzoate sodium salt", reason: "May cause non-allergic sensitivity."),
    EAdditive(name: "E220", description: "Sulfur Dioxide", reason: "May cause non-allergic sensitivity."),
    EAdditive(name: "E221", description: "Sodium Sulfite", reason: "May cause non-allergic sensitivity."),
    EAdditive(name: "E222", description: "Sodium Bisulfite", reason: "May cause non-allergic sensitivity."),
    EAdditive(name: "E223", description: "Sodium Metabisulfite", reason: "May cause non-allergic sensitivity."),
    EAdditive(name: "E224", description: "Potassium Metabisulfite", reason: "May cause non-allergic sensitivity."),
    EAdditive(name: "E226", description: "Calcium Sulfite", reason: "May cause non-allergic sensitivity."),
    EAdditive(name: "E227", description: "Calcium Bisulfite", reason: "May cause non-allergic sensitivity."),
    EAdditive(name: "E228", description: "Potassium Bisulfite", reason: "May cause non-allergic sensitivity."),
    EAdditive(name: "E320", description: "Butylated Hydroxyanisole (BHA)", reason: "May be a human carcinogen; concerns about long-term use."),
    EAdditive(name: "E321", description: "Butylated Hydroxytoluene (BHT)", reason: "May be a human carcinogen; concerns about long-term use."),
    EAdditive(name: "E954", description: "Saccharin", reason: "May be linked to bladder cancer in high doses; considered safe in small quantities."),
]
