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
    
    /// Adds dependency to be used in the app. Creare instances within this method.
    /// Call this method for every dependency you want to use in your app.
    public func addDependency<T>(_ dependency: T, for protocolType: Any.Type) {
        storage.add(dependency, for: protocolType)
    }
    
    public func addFactory<T>(_ factory: @escaping () -> T, for protocolType: Any.Type) {
        storage.addFactory(factory, for: protocolType)
    }
}
