import { z } from 'zod';

const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

// Validation Schemas
export const loginSchema = z.object({
    mobile: z.string({
        required_error: "Mobile number is required",
        invalid_type_error: "Mobile number must be a string"
    }).regex(/^[0-9]{10}$/, 'Mobile number must be 10 digits')
});

export const verifyOtpSchema = z.object({
    mobile: z.string({
        required_error: "Mobile number is required",
        invalid_type_error: "Mobile number must be a string"
    }).regex(/^[0-9]{10}$/, 'Mobile number must be 10 digits'),
    otp: z.string({
        required_error: "OTP is required",
        invalid_type_error: "OTP must be a string"
    }).regex(/^[0-9]{4}$/, 'OTP must be 4 digits')
});

export const emailSchema = z.object({
    email: z.string({
        required_error: "Email is required",
        invalid_type_error: "Email must be a string"
    })
      .email('Invalid email format')
      .regex(emailRegex, 'Invalid email format')
      .toLowerCase()
  });

export const verifyEmailSchema = z.object({
    email: z.string({
        required_error: "Email is required",
        invalid_type_error: "Email must be a string"
    }).email('Invalid email format') 
    .regex(emailRegex, 'Invalid email format') 
    .toLowerCase(),
    otp: z.string({
        required_error: "OTP is required",
        invalid_type_error: "OTP must be a string"
    }).regex(/^[0-9]{4}$/, 'OTP must be 4 digits')
});

export const adminLoginSchema = z.object({
    email: z.string({
        required_error: "Email is required",
        invalid_type_error: "Email must be a string"
    })
    .email('Invalid email format')
    .regex(emailRegex, 'Invalid email format')
    .toLowerCase(),
    
    password: z.string({
        required_error: "Password is required",
        invalid_type_error: "Password must be a string"
    })
    .min(6, 'Password must be at least 6 characters')
    .regex(/[!@#$%^&*(),.?":{}|<>]/, 'Password must contain at least one special character')
    .regex(/[0-9]/, 'Password must contain at least one number')
    .regex(/[a-z]/, 'Password must contain at least one lowercase letter')
    .regex(/[A-Z]/, 'Password must contain at least one uppercase letter')
    
});

