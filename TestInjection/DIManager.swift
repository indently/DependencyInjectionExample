//
//  DIManager.swift
//  TestInjection
//
//  Created by Federico on 03/05/2022.
//
//  Article by: https://medium.com/@hanneshertach/swiftui-dependency-injection-in-20-lines-b322457065a5

import Foundation

struct DependencyInjector {
    private static var dependencyList: [String:Any] = [:]
    
    /// Attempts to retrieve the dependency. If it doesn't exist, it's an error in our logic, so we throw a fatal error.
    static func resolve<T>() -> T {
        guard let t = dependencyList[String(describing: T.self)] as? T else {
            fatalError("No provider registered for type \(T.self)")
        }
        return t
    }
    
    /// Creates a "key:value" in a dictionary with the description of T being the key, and T being the actual value.
    static func register<T>(dependency: T) {
        dependencyList[String(describing: T.self)] = dependency
    }
}

/// Property wrapper to simplify injection
@propertyWrapper struct Inject<T> {
    var wrappedValue: T
    
    init() {
        self.wrappedValue = DependencyInjector.resolve()
        print("Injected <-", self.wrappedValue)
    }
}

/// Property wrapper to simplify providing
@propertyWrapper struct Provider<T> {
    var wrappedValue: T
    
    init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        DependencyInjector.register(dependency: wrappedValue)
        print("Provided ->", self.wrappedValue)
    }
}
