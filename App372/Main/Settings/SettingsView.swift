//
//  SettingsView.swift
//  App372
//
//  Created by Вячеслав on 3/8/24.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    Text("Settings")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("primary").ignoresSafeArea())
                
                Button(action: {
                    
                    guard let url = URL(string: DataManager().usagePolicy) else { return }
                    
                    UIApplication.shared.open(url)
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "doc.fill")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 15, weight: .regular))
                        
                        Text("Usage Policy")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 15, weight: .regular))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 13, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("primary")))
                    .padding([.horizontal, .top])
                })
                
                Button(action: {
                    
                    SKStoreReviewController.requestReview()
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "doc.fill")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 15, weight: .regular))
                        
                        Text("Rate Us")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 15, weight: .regular))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 13, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("primary")))
                    .padding([.horizontal])
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    SettingsView()
}
