//
//  SubscriptionsView.swift
//  App372
//
//  Created by Вячеслав on 3/8/24.
//

import SwiftUI

struct SubscriptionsView: View {
    
    @StateObject var viewModel = SubscriptionsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.isChart = true
                            
                        }, label: {
                            
                            Text("EUR/USD")
                                .foregroundColor(.white)
                                .font(.system(size: 19, weight: .regular))
                        })
                        
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
                    
                    Text("Subscriptions")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("primary").ignoresSafeArea())
                
                if viewModel.subscriptions.isEmpty {
                    
                    VStack(alignment: .center, spacing: 5, content: {
                        
                        Text("No subscriptions")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 20, weight: .semibold))
                        
                        Text("To add a first subscriptions click a button on top")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            VStack(alignment: .leading, spacing: 10, content: {
                                
                                Text("Total for yours subscriptions")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Text("$\(viewModel.subscriptions.map(\.cost).reduce(0, +))/per month")
                                    .foregroundColor(.white)
                                    .font(.system(size: 19, weight: .semibold))
                            })
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                            
                            ForEach(viewModel.subscriptions, id: \.self) { index in
                            
                                VStack(alignment: .leading, spacing: 10, content: {
                                    
                                    Text(index.title ?? "")
                                        .foregroundColor(Color("primary"))
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                    Text("$\(index.cost)/per month")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .regular))
                                })
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color("primary")))
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .sheet(isPresented: $viewModel.isChart, content: {
            
            SubscriptionsChart()
        })
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            SubscriptionsAdd(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchSubscriptions()
        }
    }
}

#Preview {
    SubscriptionsView()
}
