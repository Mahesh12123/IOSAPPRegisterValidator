//
//  LoginAndRegisterValidation.swift
//
//  Created by mahesh mahara on 25/02/2025.
//


import Foundation

public struct RegisterValidator {
    
    // Validate Full Name
    public static func validateFullName(_ name: String) -> (isValid: Bool, message: String) {
        if name.isEmpty {
            return (false, "Full name cannot be empty.")
        }
        
        // Check if the full name contains only letters and spaces
        let nameRegex = "^[a-zA-Z]+(?: [a-zA-Z]+)*$"
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        if !namePredicate.evaluate(with: name) {
            return (false, "Full name should contain only letters and spaces.")
            // return false
        }
        
        // Optionally, you can check if the full name contains at least one space (first and last name)
        if !name.contains(" ") {
            return (false, "Full name should contain both first and last name.")
        }
        
        return (true, "Full name is valid.")
    }
    
    // Validate Email
    public static func validateEmail(_ email: String) -> (isValid: Bool, message: String) {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if !emailPredicate.evaluate(with: email) {
            return (false, "Invalid email format.")
        }
        return (true, "Email is valid.")
    }
    
    // Validate Password
    public static func validatePassword(_ password: String) -> (isValid: Bool, message: String) {
        
        let passwordRegex = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        if !passwordPredicate.evaluate(with: password) {
            return (false, "Password must be at least 8 characters, with at least one uppercase letter, one lowercase letter, and one number.")
        }
        
        return (true, "Password is valid.")
    }
    
    // Validate Confirm Password
    public static func validateConfirmPassword(_ password: String, _ confirmPassword: String) -> (isValid: Bool, message: String) {
        if password != confirmPassword {
            return (false, "Passwords do not match.")
        }
        return (true, "Passwords match.")
    }
    
    // Validate  10-digit phone number
    public static func validate10DigitPhoneNumber(_ phone: String) -> (isValid: Bool, message: String) {
        let phoneRegex = "^[0-9]{10}$" // Example: 10-digit phone number
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        if !phonePredicate.evaluate(with: phone) {
            return (false, "Invalid phone number.")
        }
        return (true, "Phone number is valid.")
    }
    
    // Function to validate phone number with optional formatting (e.g., (123) 456-7890)
    public static func isValidFormattedPhoneNumber(_ phone: String) -> (isValid: Bool, message: String) {
        let phoneRegex = "^\\d{3}-\\d{3}-\\d{4}$" // Example: 123-456-7890
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        if !phonePredicate.evaluate(with: phone) {
            return (false, "Invalid phone number.")
        }
        return (true, "Phone number is valid.")
    }
    
    // Function to validate international phone numbers
    public static func isValidInternationalPhoneNumber(_ phone: String) -> (isValid: Bool, message: String) {
        let phoneRegex = "^\\+[0-9]{1,3}[0-9]{4,14}$" // Example: +1234567890
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        if !phonePredicate.evaluate(with: phone) {
            return (false, "Invalid phone number.")
        }
        return (true, "Phone number is valid.")
    }
    
    
}
