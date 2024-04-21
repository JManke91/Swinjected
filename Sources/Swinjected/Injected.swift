//
//  Injected.swift
//  ListSwiftUI
//
//  Created by Julian Manke on 26.03.24.
//

import Foundation

import Foundation

@propertyWrapper
/// API for dependency resolution. Example usage:
/// @Injected var propertyName PropertyClass PropertyType.self
struct Injected<T> {
    let wrappedValue: T

    init() {
        wrappedValue = DependencyStorage.shared.resolve()
    }
}

@propertyWrapper
struct LazyInjected<T> {
    private var value: T?
    private let resolver: () -> T

    init() {
        self.resolver = { DependencyStorage.shared.resolve() }
    }

    var wrappedValue: T {
        mutating get {
            if value == nil {
                value = resolver()
            }
            return value!
        }
    }
}






//@propertyWrapper
//public struct LazyInject<Value> {
//  // 1
//  private let container: DIContainer
//  private let key: String?
//  private let mode: ResolveMode
//  
//  // 2
//  private(set) public lazy var wrappedValue: Value = {
//    if let key = self.key {
//      return self.container.resolve(key: key, mode: self.mode)
//    } else {
//      return self.container.resolve(type: Value.self, mode: self.mode)
//    }
//  }()
//
//  // 3
//  public init(container: DIContainer = DependencyContainer.shared, key: String? = nil, mode: ResolveMode = .shared) {
//    self.container = container
//    self.key = key
//    self.mode = mode
//  }
//}

