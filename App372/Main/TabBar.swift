//
//  TabBar.swift
//  App372
//
//  Created by Вячеслав on 3/8/24.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {

        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index

                }, label: {
                    
                    VStack(alignment: .center, spacing: 8) {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("primary") : Color.white)
                        
                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color("primary") : Color.white)
                            .font(.system(size: 11, weight: .regular))
                    }
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 26)
        .background(Color.black)
    }
}

enum Tab: String, CaseIterable {
    
    case Responses = "Responses"
    
    case Vacancies = "Vacancies"
    
    case Subscriptions = "Subscriptions"

    case Settings = "Settings"
}
