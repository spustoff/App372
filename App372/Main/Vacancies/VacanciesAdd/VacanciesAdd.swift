//
//  VacanciesAdd.swift
//  App372
//
//  Created by Вячеслав on 3/8/24.
//

import SwiftUI

struct VacanciesAdd: View {
    
    @StateObject var viewModel: VacanciesViewModel
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
                            
                            viewModel.addVacancy()
                            viewModel.fetchVacancies()
                            
                            router.wrappedValue.dismiss()
                            
                            viewModel.title = ""
                            viewModel.salary = ""
                            viewModel.company = ""
                            viewModel.schedule = ""
                            viewModel.contacts = ""
                            viewModel.notes = ""
                            
                        }, label: {
                            
                            Image(systemName: "checkmark")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 13, weight: .semibold))
                                .frame(width: 30, height: 30)
                                .background(Circle().fill(.white))
                        })
                        .opacity(viewModel.title.isEmpty || viewModel.salary.isEmpty || viewModel.company.isEmpty || viewModel.schedule.isEmpty || viewModel.contacts.isEmpty || viewModel.notes.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.title.isEmpty || viewModel.salary.isEmpty || viewModel.company.isEmpty || viewModel.schedule.isEmpty || viewModel.contacts.isEmpty || viewModel.notes.isEmpty ? true : false)
                    }
                    
                    Text("Add Vacancy")
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
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Schedule")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.schedule.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.schedule)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
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
                            
                            Text("Notes")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.notes.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.notes)
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
    VacanciesAdd(viewModel: VacanciesViewModel())
}
