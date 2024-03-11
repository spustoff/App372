//
//  VacanciesDetailView.swift
//  App372
//
//  Created by Вячеслав on 3/8/24.
//

import SwiftUI

struct VacanciesDetailView: View {
    
    let index: VacancyModel
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.system(size: 23, weight: .semibold))
                    })
                    
                    Text(index.title ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("primary").ignoresSafeArea())
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(alignment: .leading, spacing: 20) {
                        
                        HStack {
                            
                            Text("Salary")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Text("$\(index.salary)")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .semibold))
                        }
                        
                        HStack {
                            
                            Text("Company")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Text(index.company ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .semibold))
                        }
                        
                        HStack {
                            
                            Text("Schedule")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Text(index.schedule ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .semibold))
                        }
                        
                        Text(index.contacts ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                        
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            
                            Text("Notes")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 17, weight: .semibold))
                            
                            Text(index.notes ?? "")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                        })
                    }
                    .padding()
                }
            }
        }
    }
}

//#Preview {
//    VacanciesDetailView()
//}
