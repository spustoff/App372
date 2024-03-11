//
//  SubscriptionsAdd.swift
//  App372
//
//  Created by Вячеслав on 3/8/24.
//

import SwiftUI

struct SubscriptionsAdd: View {
    
    @StateObject var viewModel: SubscriptionsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.addSubscription()
                            viewModel.fetchSubscriptions()
                            
                            router.wrappedValue.dismiss()
                            
                            viewModel.title = ""
                            viewModel.type = ""
                            viewModel.cost = ""
                            
                        }, label: {
                            
                            Image(systemName: "checkmark")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 13, weight: .semibold))
                                .frame(width: 30, height: 30)
                                .background(Circle().fill(.white))
                        })
                        .opacity(viewModel.title.isEmpty || viewModel.type.isEmpty || viewModel.cost.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.title.isEmpty || viewModel.type.isEmpty || viewModel.cost.isEmpty ? true : false)
                    }
                    
                    Text("Add Subscription")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("primary").ignoresSafeArea())
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 20) {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Title")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.title.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.title)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.6)))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Type")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.type.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.type)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.6)))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Cost")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.cost.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.cost)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                                .keyboardType(.decimalPad)
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.6)))
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    SubscriptionsAdd(viewModel: SubscriptionsViewModel())
}
