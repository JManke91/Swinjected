//
//  DependencyManager.swift
//  ListSwiftUI
//
//  Created by Julian Manke on 26.03.24.
//

import Foundation
import SwiftData

/// Collects all dependencies. Define all dependencies to be used across the app in this class.
class DependencyManager {
    private let storage = DependencyStorage.shared
    
    /// Adds dependency to be used in the app. Creare instances within this method.
    /// Call this method for every dependency you want to use in your app.
    func addDependency<T>(_ dependency: T, for protocolType: Any.Type) {
        storage.add(dependency, for: protocolType)
    }
}
