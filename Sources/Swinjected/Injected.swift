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

