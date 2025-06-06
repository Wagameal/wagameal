import mongoose, { Schema, Document } from 'mongoose';
import { z } from 'zod';


export const otpSchema = z.object({
    mobile: z.string({
        required_error: "Mobile number is required",
        invalid_type_error: "Mobile number must be a string"
    }).regex(/^\d{10}$/, "Mobile number must be exactly 10 digits").optional(),
    
    email: z.string({
        required_error: "Email is required",
        invalid_type_error: "Email must be a string"
    }).email("Invalid email format").optional(),
    
    otp: z.string({
        required_error: "OTP is required",
        invalid_type_error: "OTP must be a string"
    }).regex(/^\d{4}$/, "OTP must be exactly 4 digits"),

    expirationTime: z.date({
        required_error: "Expiration time is required",
        invalid_type_error: "Expiration time must be a date"
    })
});

// Type inference from Zod schema
export type OtpType = z.infer<typeof otpSchema>;

interface IOtp extends Document, OtpType {}


// Mongoose schema
const mongooseOtpSchema: Schema = new Schema({
    mobile: { type: String },
    email: { type: String },
    otp: { type: String, required: true },
    expirationTime: { type: Date, required: true }
});

mongooseOtpSchema.index({ mobile: 1, email: 1 });

const Otp = mongoose.model<IOtp>('otp', mongooseOtpSchema);
export default Otp;