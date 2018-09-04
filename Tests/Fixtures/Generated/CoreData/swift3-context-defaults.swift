// swiftlint:disable all

import CoreData
import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length
// swiftlint:disable attributes

// swiftlint:disable identifier_name line_length type_body_length
@objc(ChildEntity)
internal class ChildEntity: MainEntity {

    override internal class func entityName() -> String {
        return "ChildEntity"
    }

    override internal class func entity(in managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: entityName(), in: managedObjectContext)
    }

    @nonobjc internal class func fetchRequest() -> NSFetchRequest<ChildEntity> {
        return NSFetchRequest<ChildEntity>(entityName: entityName())
    }

}


@objc(MainEntity)
internal class MainEntity: NSManagedObject {

    internal class func entityName() -> String {
        return "MainEntity"
    }

    internal class func entity(in managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: entityName(), in: managedObjectContext)
    }

    @nonobjc internal class func fetchRequest() -> NSFetchRequest<MainEntity> {
        return NSFetchRequest<MainEntity>(entityName: entityName())
    }

    @NSManaged internal var attributedString: NSAttributedString?

    @NSManaged internal var binaryData: Data?

    @NSManaged internal var boolean: Bool

    @NSManaged internal var date: Date?

    @NSManaged internal var decimal: NSDecimalNumber?

    @NSManaged internal var double: Double

    @NSManaged internal var float: Float

    @NSManaged internal var int16: Int16

    @NSManaged internal var int32: Int32

    @NSManaged internal var int64: Int64

    @NSManaged internal var nonOptional: String!

    @NSManaged internal var string: String?

    @NSManaged internal var transformable: AnyObject?

    @NSManaged internal var transient: String?

    @NSManaged internal var uri: URL?

    @NSManaged internal var uuid: UUID?

    @NSManaged internal var manyToMany: Set<SecondaryEntity>

    @NSManaged internal var oneToMany: NSOrderedSet

    @NSManaged internal var oneToOne: SecondaryEntity?

    @NSManaged internal var fetchedProperty: [NewEntity]
}

extension MainEntity {

    @objc(addManyToManyObject:)
    @NSManaged public func addToManyToMany(_ value: SecondaryEntity)

    @objc(removeManyToManyObject:)
    @NSManaged public func removeFromManyToMany(_ value: SecondaryEntity)

    @objc(addManyToMany:)
    @NSManaged public func addToManyToMany(_ values: Set<SecondaryEntity>)

    @objc(removeManyToMany:)
    @NSManaged public func removeFromManyToMany(_ values: Set<SecondaryEntity>)

}

extension MainEntity {

    @objc(insertObject:inOneToManyAtIndex:)
    @NSManaged public func insertIntoOneToMany(_ value: SecondaryEntity, at idx: Int)

    @objc(removeObjectFromOneToManyAtIndex:)
    @NSManaged public func removeFromOneToMany(at idx: Int)

    @objc(insertOneToMany:atIndexes:)
    @NSManaged public func insertIntoOneToMany(_ values: [SecondaryEntity], at indexes: NSIndexSet)

    @objc(removeOneToManyAtIndexes:)
    @NSManaged public func removeFromOneToMany(at indexes: NSIndexSet)

    @objc(replaceObjectInOneToManyAtIndex:withObject:)
    @NSManaged public func replaceOneToMany(at idx: Int, with value: SecondaryEntity)

    @objc(replaceOneToManyAtIndexes:withOneToMany:)
    @NSManaged public func replaceOneToMany(at indexes: NSIndexSet, with values: [SecondaryEntity])

    @objc(addOneToManyObject:)
    @NSManaged public func addToOneToMany(_ value: SecondaryEntity)

    @objc(removeOneToManyObject:)
    @NSManaged public func removeFromOneToMany(_ value: SecondaryEntity)

    @objc(addOneToMany:)
    @NSManaged public func addToOneToMany(_ values: NSOrderedSet)

    @objc(removeOneToMany:)
    @NSManaged public func removeFromOneToMany(_ values: NSOrderedSet)

}


extension MainEntity {

    class func fetchDictionaryFetchRequest(managedObjectContext: NSManagedObjectContext) throws -> [[String: Any]] {
        guard let persistentStoreCoordinator = managedObjectContext.persistentStoreCoordinator else {
            fatalError("Managed object context has no persistent store coordinator for getting fetch request templates")
        }
        let model = persistentStoreCoordinator.managedObjectModel
        let substitutionVariables: [String: Any] = [
            :
        ]

        guard let fetchRequest = model.fetchRequestFromTemplate(withName: "DictionaryFetchRequest", substitutionVariables: substitutionVariables) else {
            fatalError("No fetch request template named 'DictionaryFetchRequest' found.")
        }

        return try managedObjectContext.fetch(fetchRequest) as! [[String: Any]]
    }
    class func fetchObjectFetchRequest(managedObjectContext: NSManagedObjectContext, uuid: UUID) throws -> [MainEntity] {
        guard let persistentStoreCoordinator = managedObjectContext.persistentStoreCoordinator else {
            fatalError("Managed object context has no persistent store coordinator for getting fetch request templates")
        }
        let model = persistentStoreCoordinator.managedObjectModel
        let substitutionVariables: [String: Any] = [
            "UUID": uuid
        ]

        guard let fetchRequest = model.fetchRequestFromTemplate(withName: "ObjectFetchRequest", substitutionVariables: substitutionVariables) else {
            fatalError("No fetch request template named 'ObjectFetchRequest' found.")
        }

        return try managedObjectContext.fetch(fetchRequest) as! [MainEntity]
    }
    class func fetchObjectIDFetchRequest(managedObjectContext: NSManagedObjectContext, name: String) throws -> [NSManagedObjectID] {
        guard let persistentStoreCoordinator = managedObjectContext.persistentStoreCoordinator else {
            fatalError("Managed object context has no persistent store coordinator for getting fetch request templates")
        }
        let model = persistentStoreCoordinator.managedObjectModel
        let substitutionVariables: [String: Any] = [
            "NAME": name
        ]

        guard let fetchRequest = model.fetchRequestFromTemplate(withName: "ObjectIDFetchRequest", substitutionVariables: substitutionVariables) else {
            fatalError("No fetch request template named 'ObjectIDFetchRequest' found.")
        }

        return try managedObjectContext.fetch(fetchRequest) as! [NSManagedObjectID]
    }

}
@objc(SecondaryEntity)
internal class SecondaryEntity: NSManagedObject {

    internal class func entityName() -> String {
        return "SecondaryEntity"
    }

    internal class func entity(in managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: entityName(), in: managedObjectContext)
    }

    @nonobjc internal class func fetchRequest() -> NSFetchRequest<SecondaryEntity> {
        return NSFetchRequest<SecondaryEntity>(entityName: entityName())
    }

    @NSManaged internal var name: String!

    @NSManaged internal var manyToMany: Set<MainEntity>

    @NSManaged internal var oneToMany: MainEntity?

    @NSManaged internal var oneToOne: MainEntity?

}

extension SecondaryEntity {

    @objc(addManyToManyObject:)
    @NSManaged public func addToManyToMany(_ value: MainEntity)

    @objc(removeManyToManyObject:)
    @NSManaged public func removeFromManyToMany(_ value: MainEntity)

    @objc(addManyToMany:)
    @NSManaged public func addToManyToMany(_ values: Set<MainEntity>)

    @objc(removeManyToMany:)
    @NSManaged public func removeFromManyToMany(_ values: Set<MainEntity>)

}


@objc(AbstractEntity)
internal class AbstractEntity: NSManagedObject {

    internal class func entityName() -> String {
        return "AbstractEntity"
    }

    internal class func entity(in managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: entityName(), in: managedObjectContext)
    }

    @nonobjc internal class func fetchRequest() -> NSFetchRequest<AbstractEntity> {
        return NSFetchRequest<AbstractEntity>(entityName: entityName())
    }

}


@objc(NewEntity)
internal class NewEntity: AbstractEntity {

    override internal class func entityName() -> String {
        return "NewEntity"
    }

    override internal class func entity(in managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: entityName(), in: managedObjectContext)
    }

    @nonobjc internal class func fetchRequest() -> NSFetchRequest<NewEntity> {
        return NSFetchRequest<NewEntity>(entityName: entityName())
    }

    @NSManaged internal var identifier: UUID?

}


// swiftlint:enable identifier_name line_length type_body_length
