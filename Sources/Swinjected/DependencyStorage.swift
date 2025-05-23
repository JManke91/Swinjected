//
//  DependencyStorage.swift
//  ListSwiftUI
//
//  Created by Julian Manke on 26.03.24.
//

import Foundation

public class DependencyStorage {

    // MARK: - Private properties

    private var storage = [String: Any]()
    private var factories = [String: () -> Any]()
    private var lock = NSLock()
    
    // MARK: - Singleton

    public static var shared = DependencyStorage()
    
    // MARK: - Init

    public init() {}

    
    /// Adds aa singleton instance to the storage, which is uniquely used accross the app lifecycle.
    /// - Parameters:
    ///   - dependency: Dependency to be registered.
    ///   - type: Type of the dependency.
    public func add<T>(_ dependency: T, for type: Any.Type) {
        defer { lock.unlock() }
        lock.lock()
        let id = String(describing: type)
        storage[id] = dependency
    }
    
    
    /// Adds a factory creation of a class to storage, which creates a new instance every time it is resolved. This can be useful when many instances of a dependency are required, such as for viewModels in a list.
    /// - Parameters:
    ///   - factory: Dependency to be registered.
    ///   - type: Type of the dependency.
    public func addFactory<T>(_ factory: @escaping () -> T, for type: Any.Type) {
        defer { lock.unlock() }
        lock.lock()
        let id = String(describing: type)
        factories[id] = factory
    }

    public func resolve<T>() -> T {
        defer { lock.unlock() }
        lock.lock()
        let id = String(describing: T.self)
        
        if let singleton = storage[id] as? T {
            return singleton
        }
        
        if let factory = factories[id], let instance = factory() as? T {
            return instance
        }
        
        fatalError("Could not resolve for \(T.self)")
    }
}
