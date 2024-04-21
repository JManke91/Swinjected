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
public struct Injected<T> {
    let wrappedValue: T

    public init() {
        wrappedValue = DependencyStorage.shared.resolve()
    }
}

