import mongoose, { Schema, Document, Types } from 'mongoose';
import { z } from 'zod';

// Define the Zod schema for validation
export const petSchema = z.object({
  name: z.string(
    { required_error: "Pet name is required", invalid_type_error: "Pet name must be a string" }
  ).min(1, "Pet name is required"),
  type: z.string({
    required_error: "Pet type is required",
    invalid_type_error: "Pet type must be a string"
  }).refine(value => ['dog', 'cat'].includes(value), {
    message: "Pet type must be one of: dog, cat, bird, fish, reptile"
  }),
  breed: z.string({
    invalid_type_error: "Breed must be a string",
    required_error: "Breed is required if pet type is dog or cat"
  }).optional().refine(value => value === undefined || value.length > 0, {
    message: "Breed cannot be an empty string"
  }),
  age: z.number({
    invalid_type_error: "Age must be a number",
    required_error: "Age is required if pet type is dog or cat"
  }).min(0, "Age must be a positive number")
    .refine(value => value >= 0, {
      message: "Age must be a positive number"
    }).optional(),
  weight: z.number().min(0, "Weight must be a positive number").optional(),
  owner: z.instanceof(Types.ObjectId).refine(value => Types.ObjectId.isValid(value), {
    message: "Owner must be a valid ObjectId"
  }),
  notes: z.string().optional(),

});

export type PetType = z.infer<typeof petSchema>;

interface IPet extends Document, PetType {}

// Create the Mongoose schema
const petMongooseSchema: Schema = new Schema(
    {
        name: { type: String, required: true },
        type: { type: String, required: true, enum: ['dog', 'cat'] },
        breed: { type: String, required: false },
        age: { type: Number, required: false, min: 0 },
        weight: { type: Number, required: false, min: 0 },
        owner: { type: Schema.Types.ObjectId, ref: 'users', required: true },
        notes: { type: String, required: false },
    },{
    versionKey: false,
    timestamps: true
})

// Create and export the model
const Pet = mongoose.model<IPet>('pets', petMongooseSchema);
export default Pet;

