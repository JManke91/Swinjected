//
//  DependencyStorage.swift
//  ListSwiftUI
//
//  Created by Julian Manke on 26.03.24.
//

import Foundation

import Foundation

public class DependencyStorage {
    // MARK: - Singleton

    public static var shared = DependencyStorage()

    // MARK: - Private properties

    private var storage = [String: Any]()

    // MARK: - Init

    public init() {}

    func add<T>(_ dependency: T, for type: Any.Type) {
        let id = String(describing: type)
        storage[id] = dependency
    }

    public func resolve<T>() -> T {
        let id = "\(T.self)"

        // FIXME: Remove fatalerrors
        // https://medium.com/streamotion-tech-blog/magic-dependency-injection-in-swift-70476c7743ec
        guard let dependency = storage[id], let castedDependency = dependency as? T else {
            fatalError("Could not resolve for \(T.self)")
        }

        return castedDependency
    }
}
