import mongoose, { Schema, Document } from 'mongoose';
import { z } from 'zod';

// Define the Zod schema for Admin
export const adminSchema = z.object({
  name: z.string({
    required_error: "Name is required",
    invalid_type_error: "Name must be a string"
  }).min(2, "Name must be at least 2 characters"),
  email: z.string({
    required_error: "Email is required",
    invalid_type_error: "Email must be a string"
  }).email("Invalid email format"),
  password: z.string({
    required_error: "Password is required",
    invalid_type_error: "Password must be a string"
  }).min(6, "Password must be at least 6 characters"),
  mobile: z.string({
    required_error: "Mobile number is required",
    invalid_type_error: "Mobile number must be a string"
  }).regex(/^\d{10}$/, "Mobile number must be 10 digits"),
  role: z.string().default('admin'),
});

// Type inference from Zod schema
export type AdminType = z.infer<typeof adminSchema>;
interface IAdmin extends Document, AdminType {} 

const mongooseAdminSchema: Schema = new Schema({
  name: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  mobile: { type: String, required: true },
  role: { type: String, default: 'admin' },
}, {
  versionKey: false,
  timestamps: true
});


const Admin = mongoose.model<IAdmin>('Admin', mongooseAdminSchema);
export default Admin;
