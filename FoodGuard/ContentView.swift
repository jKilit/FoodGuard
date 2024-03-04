import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var API = FoodAPI()
    @State private var preferencesModel = PreferencesModel()

    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }

            NavigationStack {
                PreferencesView(preferencesModel: preferencesModel)
            }
            .tabItem {
                Label("My preferences", systemImage: "square.and.pencil")
            }

            NavigationStack {
                BarcodeScannerView()
            }
            .tabItem {
                Label("Scanner", systemImage: "barcode.viewfinder")
            }

            NavigationStack {
                ProductHistoryView()
            }
            .tabItem {
                Label("Product History", systemImage: "clock.arrow.circlepath")
            }
        }
    }
} 
