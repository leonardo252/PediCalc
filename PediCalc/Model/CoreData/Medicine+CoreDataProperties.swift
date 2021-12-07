//
//  Medicine+CoreDataProperties.swift
//  PediCalc
//
//  Created by Leonardo Gomes Fernandes on 11/02/21.
//
//

import Foundation
import CoreData

extension Medicine {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Medicine> {
        return NSFetchRequest<Medicine>(entityName: "Medicine")
    }

    @NSManaged public var name: String?
    @NSManaged public var dose: [String]?
    @NSManaged public var dilution: String?
    @NSManaged public var redilution: String?
    @NSManaged public var notes: String?
    @NSManaged public var favorite: Bool

}

extension Medicine : Identifiable {

}
