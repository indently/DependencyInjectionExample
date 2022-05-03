//
//  Test.swift
//  DependencyLookup
//
//  Created by Federico on 29/04/2022.
//

import Foundation

//MARK: Set up your dependencies before you refer to them
class Dependencies {
    init() {
        /// Can be swapped out easily with anything that conforms to the DataProtocol protocol
        @Provider var dataStorage = DataStorage(testMode: true) as DataProtocol
        @Provider var df = DataFormatter()
    }
}

class AppStuff {
    /// Easily inject any class you want in to any class that needs them
    @Inject var dataStorage: DataProtocol
    @Inject var df: DataFormatter
    
    func storeData(data: String) {
        dataStorage.setData(data: data)
    }
    
    func viewData() {
        let data = dataStorage.getData()
        print(data)
    }
    
    func formatData() {
        let data = dataStorage.getData()
        print(df.formatSomething(data: data))
    }
}

class ExampleClass {
    /// Easily inject any class you want in to any class that needs them
    @Inject var dataStorage: DataProtocol
    @Inject var df: DataFormatter
    
    init() {
        print("ExampleClass init:", dataStorage.getData())
    }
}

/// Remember to set up your dependencies before you use them
let setup = Dependencies()

/// Write your code as you normally would
let appStuff = AppStuff()
let exampleClass = ExampleClass()
appStuff.viewData()
appStuff.formatData()

