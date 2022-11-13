//
//  DailyLog+CoreDataProperties.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 13.11.22.
//
//

import Foundation
import CoreData


extension DailyLog {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DailyLog> {
        return NSFetchRequest<DailyLog>(entityName: "DailyLog")
    }

    @NSManaged public var date: DateComponents?
    @NSManaged public var id: UUID?
    @NSManaged public var nutrientEntries: NSSet?

}

// MARK: Generated accessors for nutrientEntries
extension DailyLog {

    @objc(addNutrientEntriesObject:)
    @NSManaged public func addToNutrientEntries(_ value: NutrientEntry)

    @objc(removeNutrientEntriesObject:)
    @NSManaged public func removeFromNutrientEntries(_ value: NutrientEntry)

    @objc(addNutrientEntries:)
    @NSManaged public func addToNutrientEntries(_ values: NSSet)

    @objc(removeNutrientEntries:)
    @NSManaged public func removeFromNutrientEntries(_ values: NSSet)

}

extension DailyLog : Identifiable {

}
