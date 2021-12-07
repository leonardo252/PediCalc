//
//  CoreDataMenager.swift
//  PediCalc
//
//  Created by Leonardo Gomes Fernandes on 11/02/21.
//

import Foundation
import CoreData
import UIKit

class CDManager {

    let viewContext = ((UIApplication.shared.delegate as? AppDelegate) ?? AppDelegate()).persistentContainer.viewContext
    
    let coordinator = ((UIApplication.shared.delegate as? AppDelegate) ?? AppDelegate()).persistentContainer.persistentStoreCoordinator
    
    func saveContext() -> Bool {
        
        do {
            try viewContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            return false
        }
        
        return true
    }
    
    func saveMedicine(jsMedicine: JSMedicine) -> Bool {
        
        let medicine = Medicine(context: self.viewContext)
        medicine.name = jsMedicine.name
        medicine.dose = jsMedicine.dose
        medicine.dilution = jsMedicine.dilution
        medicine.redilution = jsMedicine.redilution
        medicine.notes = jsMedicine.notes
        
        return saveContext()
    }
    
    func populateMedicines(medicines: [JSMedicine]) -> Bool {
        
        for medicine in medicines {
            if !self.saveMedicine(jsMedicine: medicine) {
                return false
            }
        }
        return true
    }
    
    func requestMedicineByName(nome: String) -> [Medicine] {
        let requestMedicine = Medicine.fetchRequest() as NSFetchRequest<Medicine>
        requestMedicine.predicate = NSPredicate(format: "name CONTAINS[CD] %@", nome)
        
        do {
            let medicines = try viewContext.fetch(requestMedicine)
            return medicines
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        return [Medicine()]
    }
    
    func listMedicines() -> [Medicine] {
        
        var medicineList: [Medicine] = []
        do {
            let request = Medicine.fetchRequest() as NSFetchRequest<Medicine>

            medicineList = try viewContext.fetch(request)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }

        return medicineList
    }

//    func clearDatabase(entity: String ) -> Bool{
//        let context = viewContext
//        let coord = coordinator
//        
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity )
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//        
//        do {
//            try coord.execute(deleteRequest, with: context)
//        } catch let error as NSError {
//            debugPrint(error)
//            return false
//        }
//        return true
//    }
}
