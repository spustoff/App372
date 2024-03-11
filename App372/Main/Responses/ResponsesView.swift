//
//  ResponsesView.swift
//  App372
//
//  Created by Вячеслав on 3/8/24.
//

import SwiftUI

struct ResponsesView: View {
    
    @StateObject var viewModel = ResponsesViewModel()
    
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
                    
                    Text("Responses")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("primary").ignoresSafeArea())
                
                if viewModel.responses.isEmpty {
                    
                    VStack(alignment: .center, spacing: 5, content: {
                        
                        Text("No responses")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 20, weight: .semibold))
                        
                        Text("To add a first response click a button on top")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.responses, id: \.self) { index in
                            
                                NavigationLink(destination: {
                                    
                                    ResponsesDetailView(index: index)
                                        .navigationBarBackButtonHidden()
                                    
                                }, label: {
                                    
                                    VStack(spacing: 0) {
                                        
                                        VStack(alignment: .leading, spacing: 5, content: {
                                            
                                            HStack {
                                                
                                                Circle()
                                                    .fill(.black)
                                                    .frame(width: 10, height: 10)
                                                
                                                Text(index.status ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 14, weight: .regular))
                                            }
                                            
                                            Text(index.title ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 23, weight: .semibold))
                                        })
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                                        
                                        VStack(alignment: .leading, spacing: 10, content: {
                                            
                                            Text(index.company ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 14, weight: .regular))
                                            
                                            HStack {
                                                
                                                VStack(alignment: .center, spacing: 5, content: {
                                                    
                                                    Text("Salary")
                                                        .foregroundColor(.gray)
                                                        .font(.system(size: 13, weight: .regular))
                                                    
                                                    Text("$\(index.salary)")
                                                        .foregroundColor(.black)
                                                        .font(.system(size: 15, weight: .semibold))
                                                })
                                                
                                                VStack(alignment: .center, spacing: 5, content: {
                                                    
                                                    Text("Published")
                                                        .foregroundColor(.gray)
                                                        .font(.system(size: 13, weight: .regular))
                                                    
                                                    Text(index.publishing_date ?? "")
                                                        .foregroundColor(.black)
                                                        .font(.system(size: 15, weight: .semibold))
                                                })
                                                .frame(maxWidth: .infinity)
                                                
                                                VStack(alignment: .center, spacing: 5, content: {
                                                    
                                                    Text("Responded")
                                                        .foregroundColor(.gray)
                                                        .font(.system(size: 13, weight: .regular))
                                                    
                                                    Text(index.response_date ?? "")
                                                        .foregroundColor(.black)
                                                        .font(.system(size: 15, weight: .semibold))
                                                })
                                            }
                                        })
                                        .padding()
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
            
            viewModel.fetchResponses()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            ResponsesAddView(viewModel: viewModel)
        })
    }
}

#Preview {
    ResponsesView()
}
