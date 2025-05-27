import mongoose, { Schema, Document, Types } from 'mongoose';
import { z } from 'zod';

// Define the Zod schema for validation
export const mealSchema = z.object({
    name: z.string({
        required_error: "Meal name is required",
        invalid_type_error: "Meal name must be a string"
    }).min(1, "Meal name is required"),
    type: z.string({
        required_error: "Meal type is required",
        invalid_type_error: "Meal type must be a string"
    }).refine(value => ['veg', 'non-veg'].includes(value), {
        message: "Meal type must be one of: breakfast, lunch, dinner"
    }),
    description: z.string({
        invalid_type_error: "Description must be a string",
        required_error: "Description is required"
    }).min(1, "Description must not be empty"),
    quantity: z.number({
        invalid_type_error: "Quantity must be a number",
        required_error: "Quantity is required"
    }).min(1, "Quantity must be at least 1"),
    unit: z.string({
        invalid_type_error: "Unit must be a string",
        required_error: "Unit is required"
    }).refine(value => ['kg', 'grams'].includes(value), {
        message: "Unit must be one of: kg, g, liters, ml"
    }),
    price: z.number({
        invalid_type_error: "Price must be a number",
        required_error: "Price is required"
    }).min(0, "Price must be a positive number"),
});

export type MealType = z.infer<typeof mealSchema>;

interface IMeal extends Document, MealType {}


// Create the Mongoose schema
const mealMongooseSchema: Schema = new Schema(
    {
        name: { type: String, required: true },
        type: { type: String, required: true, enum: ['veg', 'non-veg'] },
        description: { type: String, required: true },
        quantity: { type: Number, required: true, min: 1 },
        unit: { type: String, required: true, enum: ['kg', 'grams'] },
        price: { type: Number, required: true, min: 0 },
    },
    {
        versionKey: false,
        timestamps: true
    }
);


// Create and export the model
const Meal = mongoose.model<IMeal>('meals', mealMongooseSchema);
export default Meal;
