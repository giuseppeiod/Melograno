//
//  season+CoreDataProperties.swift
//  
//
//  Created by Rita Marrano on 16/05/23.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension season {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<season> {
        return NSFetchRequest<season>(entityName: "season")
    }

    @NSManaged public var timestamp: Date?

}

extension season : Identifiable {

}
