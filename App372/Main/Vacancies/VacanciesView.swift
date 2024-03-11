//
//  VacanciesView.swift
//  App372
//
//  Created by Вячеслав on 3/8/24.
//

import SwiftUI

struct VacanciesView: View {
    
    @StateObject var viewModel = VacanciesViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.isAdd = true
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 13, weight: .semibold))
                                .frame(width: 30, height: 30)
                                .background(Circle().fill(.white))
                        })
                    }
                    
                    Text("Vacancies")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("primary").ignoresSafeArea())
                
                if viewModel.vacancies.isEmpty {
                    
                    VStack(alignment: .center, spacing: 5, content: {
                        
                        Text("No vacancies")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 20, weight: .semibold))
                        
                        Text("To add a first vacancy click a button on top")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                            
                            ForEach(viewModel.vacancies, id: \.self) { index in
                            
                                NavigationLink(destination: {
                                    
                                    VacanciesDetailView(index: index)
                                        .navigationBarBackButtonHidden()
                                    
                                }, label: {
                                    
                                    VStack(alignment: .leading, spacing: 0) {
                                        
                                        VStack(alignment: .leading, spacing: 5, content: {
                                            
                                            Text(index.title ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 23, weight: .semibold))
                                        })
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                                        
                                        VStack(alignment: .leading, spacing: 5, content: {
                                            
                                            HStack {
                                                
                                                Image(systemName: "clock")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Text("Schedule")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 14, weight: .regular))
                                            }
                                            
                                            Text(index.schedule ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 15, weight: .regular))
                                        })
                                        .padding(.bottom, 15)
                                        .padding()
                                        
                                        Text("$\(index.salary)")
                                            .foregroundColor(.black)
                                            .font(.system(size: 20, weight: .semibold))
                                            .padding([.horizontal, .bottom])
                                    }
                                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("primary")))
                                })
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.fetchVacancies()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            VacanciesAdd(viewModel: viewModel)
        })
    }
}

#Preview {
    VacanciesView()
}
