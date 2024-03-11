//
//  SubscriptionsViewModel.swift
//  App372
//
//  Created by Вячеслав on 3/8/24.
//

import SwiftUI
import CoreData

final class SubscriptionsViewModel: ObservableObject {
    
    @Published var subscriptions: [SubscriptionModel] = []
    
    @Published var isAdd: Bool = false
    @Published var isChart: Bool = false
    
    @Published var title: String = ""
    @Published var type: String = ""
    @Published var cost: String = ""
    
    func addSubscription() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "SubscriptionModel", into: context) as! SubscriptionModel

        loan.title = title
        loan.type = type
        loan.cost = Int16(cost) ?? 0

        CoreDataStack.shared.saveContext()
    }
    
    func fetchSubscriptions() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<SubscriptionModel>(entityName: "SubscriptionModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.subscriptions = result
            
        } catch _ as NSError {
            
            self.subscriptions = []
        }
    }
}
