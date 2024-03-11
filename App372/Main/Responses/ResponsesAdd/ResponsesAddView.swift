//
//  ResponsesAddView.swift
//  App372
//
//  Created by Вячеслав on 3/8/24.
//

import SwiftUI

struct ResponsesAddView: View {
    
    @StateObject var viewModel: ResponsesViewModel
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
                            
                            viewModel.addResponse()
                            viewModel.fetchResponses()
                            
                            router.wrappedValue.dismiss()
                            
                            viewModel.title = ""
                            viewModel.status = ""
                            viewModel.company = ""
                            viewModel.publishing_date = ""
                            viewModel.response_date = ""
                            viewModel.salary = ""
                            viewModel.contacts = ""
                            viewModel.cover_letter = ""
                            
                        }, label: {
                            
                            Image(systemName: "checkmark")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 13, weight: .semibold))
                                .frame(width: 30, height: 30)
                                .background(Circle().fill(.white))
                        })
                        .opacity(viewModel.title.isEmpty || viewModel.status.isEmpty || viewModel.company.isEmpty || viewModel.publishing_date.isEmpty || viewModel.response_date.isEmpty || viewModel.salary.isEmpty || viewModel.contacts.isEmpty || viewModel.cover_letter.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.title.isEmpty || viewModel.status.isEmpty || viewModel.company.isEmpty || viewModel.publishing_date.isEmpty || viewModel.response_date.isEmpty || viewModel.salary.isEmpty || viewModel.contacts.isEmpty || viewModel.cover_letter.isEmpty ? true : false)
                    }
                    
                    Text("Add Response")
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
                            
                            Text("Status")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.status.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.status)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.6)))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Company")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.company.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.company)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.6)))
                        
                        HStack {
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Date of publishing")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.publishing_date.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.publishing_date)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.6)))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Date of response")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.response_date.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.response_date)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.6)))
                        }
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Salary")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.salary.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.salary)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                                .keyboardType(.decimalPad)
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.6)))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Contacts")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.contacts.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.contacts)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.6)))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Cover letter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.cover_letter.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.cover_letter)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
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
    ResponsesAddView(viewModel: ResponsesViewModel())
}
