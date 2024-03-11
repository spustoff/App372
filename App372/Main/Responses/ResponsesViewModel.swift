//
//  ResponsesViewModel.swift
//  App372
//
//  Created by Вячеслав on 3/8/24.
//

import SwiftUI
import CoreData

final class ResponsesViewModel: ObservableObject {
    
    @Published var responses: [ResponseModel] = []
    @Published var isAdd: Bool = false
    
    @Published var title: String = ""
    @Published var status: String = ""
    @Published var company: String = ""
    @Published var publishing_date: String = ""
    @Published var response_date: String = ""
    @Published var salary: String = ""
    @Published var contacts: String = ""
    @Published var cover_letter: String = ""
    
    func addResponse() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ResponseModel", into: context) as! ResponseModel

        loan.title = title
        loan.status = status
        loan.company = company
        loan.publishing_date = publishing_date
        loan.response_date = response_date
        loan.salary = Int16(salary) ?? 0
        loan.contacts = contacts
        loan.cover_letter = cover_letter

        CoreDataStack.shared.saveContext()
    }
    
    func fetchResponses() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ResponseModel>(entityName: "ResponseModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.responses = result
            
        } catch _ as NSError {
            
            self.responses = []
        }
    }
}
