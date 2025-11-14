// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
public class IoTLibrary {
    @MainActor public static let shared = IoTLibrary()
    public func loginUser() -> String {
        return "Hello, World! Login User"
    }
    
    public func showAlert(title: String, message: String)
    {
        AlertHelper.showAlert(title: title, message: message)
    }
}
