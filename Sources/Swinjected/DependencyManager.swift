//
//  DependencyManager.swift
//  ListSwiftUI
//
//  Created by Julian Manke on 26.03.24.
//

import Foundation
import SwiftData

/// Collects all dependencies. Define all dependencies to be used across the app in this class.
public class DependencyManager {
    private let storage = DependencyStorage.shared
    
    // MARK: - Init
    public init() {}
    
    /// Adds aa singleton instance to the storage, which is uniquely used accross the app lifecycle.
    /// Call this method for every dependency you want to use in your app.
    /// - Parameters:
    ///   - dependency: Dependency to be registered.
    ///   - type: Type of the dependency.
    public func addDependency<T>(_ dependency: T, for protocolType: Any.Type) {
        storage.add(dependency, for: protocolType)
    }
    
    
    /// Adds a factory creation of a class to storage, which creates a new instance every time it is resolved. This can be useful when many instances of a dependency are required, such as for viewModels in a list.
    /// - Parameters:
    ///   - factory: Dependency to be registered.
    ///   - type: Type of the dependency.
    public func addFactory<T>(_ factory: @escaping () -> T, for protocolType: Any.Type) {
        storage.addFactory(factory, for: protocolType)
    }
}
