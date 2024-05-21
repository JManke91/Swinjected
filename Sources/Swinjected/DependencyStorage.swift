//
//  DependencyStorage.swift
//  ListSwiftUI
//
//  Created by Julian Manke on 26.03.24.
//

import Foundation

public class DependencyStorage {
    // MARK: - Singleton

    public static var shared = DependencyStorage()

    // MARK: - Private properties

    private var storage = [String: Any]()
    private var factories = [String: () -> Any]()

    // MARK: - Init

    public init() {}

    public func add<T>(_ dependency: T, for type: Any.Type) {
        let id = String(describing: type)
        storage[id] = dependency
    }
    
    public func addFactory<T>(_ factory: @escaping () -> T, for type: Any.Type) {
        let id = String(describing: type)
        factories[id] = factory
    }

    public func resolve<T>() -> T {
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
