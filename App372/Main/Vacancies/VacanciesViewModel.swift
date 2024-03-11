//
//  VacanciesViewModel.swift
//  App372
//
//  Created by Вячеслав on 3/8/24.
//

import SwiftUI
import CoreData

final class VacanciesViewModel: ObservableObject {
    
    @Published var vacancies: [VacancyModel] = []
    @Published var isAdd: Bool = false
    
    @Published var title: String = ""
    @Published var salary: String = ""
    @Published var company: String = ""
    @Published var schedule: String = ""
    @Published var contacts: String = ""
    @Published var notes: String = ""
    
    func addVacancy() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "VacancyModel", into: context) as! VacancyModel

        loan.title = title
        loan.salary = Int16(salary) ?? 0
        loan.company = company
        loan.schedule = schedule
        loan.contacts = contacts
        loan.notes = notes

        CoreDataStack.shared.saveContext()
    }
    
    func fetchVacancies() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<VacancyModel>(entityName: "VacancyModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.vacancies = result
            
        } catch _ as NSError {
            
            self.vacancies = []
        }
    }
}
