//
//  Injected.swift
//  ListSwiftUI
//
//  Created by Julian Manke on 26.03.24.
//

import Foundation

@propertyWrapper
/// API for dependency resolution. Example usage:
/// @Injected var propertyName PropertyClass PropertyType.self
public struct Injected<T> {
    public let wrappedValue: T

    public init() {
        wrappedValue = DependencyStorage.shared.resolve()
    }
}

@propertyWrapper
public struct LazyInjected<T> {
    private var cached: T?

    public var wrappedValue: T {
        mutating get {
            if cached == nil {
                cached = DependencyStorage.shared.resolve() as T
            }
            return cached!
        }
    }

    public init() {}
}

