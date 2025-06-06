import mongoose, { Schema, Document } from 'mongoose';
import { z } from 'zod';


// Zod schema for plan validation
export const planSchema = z.object({
    name: z.string({
        required_error: "Plan name is required",
        invalid_type_error: "Plan name must be a string"
    }).min(3, "Plan name must be at least 3 characters"),
    description: z.string({
        required_error: "Description is required",
        invalid_type_error: "Description must be a string"
    }).min(10, "Description must be at least 10 characters"),
    price: z.number({
        required_error: "Price is required",
        invalid_type_error: "Price must be a number"
    }).positive("Price must be a positive number"),
    duration: z.string({
        required_error: "Duration is required",
        invalid_type_error: "Duration must be a string"
    }).min(3, "Duration must be at least 3 characters"),
    features: z.array(z.string(), {
        required_error: "Features are required",
        invalid_type_error: "Features must be an array of strings"
    }).min(1, "At least one feature is required")
});
export type PlanType = z.infer<typeof planSchema>;

interface IPlan extends Document, PlanType {}
export default Plan;