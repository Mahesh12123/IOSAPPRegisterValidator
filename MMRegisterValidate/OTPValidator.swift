//
//  OTPValidator.swift
//  MMRegisterValidate
//
//  Created by mahesh mahara on 26/02/2025.
//

import Foundation

class OTPValidator {
    
    public  static let shared = OTPValidator()
    
    public static var currentOTP: String?
    public static var otpExpirationTime: Date?
    
    private init() {}
    
    
    // Generate a random 6-digit OTP
    public static func generateOTP() -> String {
        let otp = String(format: "%06d", arc4random_uniform(1000000))
        currentOTP = otp
        otpExpirationTime = Date().addingTimeInterval(300) // OTP expires in 5 minutes
        return otp
    }
    
    // Validate the entered OTP
    public static func validateOTP(_ enteredOTP: String , expectedLength: Int) -> (Bool, String) {
        
        if enteredOTP.isEmpty {
            return (false, "Please enter the OTP.")
        }
        
        guard let currentOTP = currentOTP, let otpExpirationTime = otpExpirationTime else {
            return (false, "No OTP generated or OTP expired.")
        }
        // Check if the OTP length matches the expected length
        guard enteredOTP.count == expectedLength else {
            return (false, " OTP Length Required NO Match.")
        }
        
        if Date() > otpExpirationTime {
            return (false, "OTP has expired. Please request a new one.")
        }
        
        if enteredOTP == currentOTP {
            return (true, "OTP validated successfully.")
        } else {
            return (false, "Invalid OTP. Please try again.")
        }
    }
    
    // Resend OTP
    public static func resendOTP() -> String {
        return generateOTP()
    }
}
