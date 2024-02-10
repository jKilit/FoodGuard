//
//  NavigationBar.swift
//  FoodGuard
//
//  Created by Edin Nasic on 2024-02-10.
//

import Foundation
import SwiftUI

struct BottomNavigationBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack{
                Button(action: {
                    selectedTab = .home
                }) {
                    Image(systemName: "house")
                }
                .padding()
                .foregroundColor(selectedTab == .home ? .blue : .gray)
                
                Button(action: {
                    selectedTab = .screen2
                }) {
                    Image(systemName: "rectangle.3.offgrid")
                }
                .padding()
                .foregroundColor(selectedTab == .screen2 ? .blue : .gray)
                
                Button(action: {
                    selectedTab = .scanner
                }) {
                    Image(systemName: "barcode.viewfinder")
                }
                .padding()
                .foregroundColor(selectedTab == .scanner ? .blue : .gray)
                
                Button(action: {
                    selectedTab = .screen4
                }) {
                    Image(systemName: "square.and.pencil")
                }
                .padding()
                .foregroundColor(selectedTab == .screen4 ? .blue : .gray)
                
                Button(action: {
                    selectedTab = .screen5
                }) {
                    Image(systemName: "gearshape")
                }
                .padding()
                .foregroundColor(selectedTab == .screen5 ? .blue : .gray)
            }
                .font(.headline)
                .background(Color.white)
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                .frame(height: 80) // Fixed height for the bottom bar
                .edgesIgnoringSafeArea(.bottom)
        }
    }
