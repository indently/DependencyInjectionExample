//
//  SampleClasses.swift
//  TestInjection
//
//  Created by Federico on 03/05/2022.
//

import Foundation

protocol DataProtocol {
    var data: String { get set }
    func setData(data: String)
    func getData() -> String
}

//MARK: Original Storage
class DataStorage: DataProtocol {
    var testMode: Bool
    var data: String
    
    
    init(testMode: Bool) {
        self.testMode = testMode
        
        if testMode {
            self.data = "This is the original storage."
        } else {
            self.data = "No data stored yet..."
        }
    }
    
    func setData(data: String) {
        self.data = data
    }
    
    func getData() -> String {
        return data
    }
}

//MARK: Mock Storage
class MockDataStorage: DataProtocol {
    var testMode: Bool
    var data: String
    
    init(testMode: Bool) {
        self.testMode = testMode
        
        if testMode {
            self.data = "This is a mock storage."
        } else {
            self.data = "No data stored yet..."
        }
    }
    
    func setData(data: String) {
        self.data = data
    }
    
    func getData() -> String {
        return data
    }
}

class DataFormatter {
    func formatSomething(data: String) -> String{
        return data.uppercased()
    }
}

