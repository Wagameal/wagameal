import mongoose, { Schema, Document, Types } from 'mongoose';
import { z } from 'zod';

// Define the Zod schema for validation
export const bannerSchema = z.object({
    title: z.string({
        required_error: "Banner title is required",
        invalid_type_error: "Banner title must be a string"
    }).min(1, "Banner title must not be empty"),
    description: z.string({
        invalid_type_error: "Description must be a string",
        required_error: "Description is required"
    }).min(1, "Description must not be empty"),
    image: z.string({
        invalid_type_error: "Image URL must be a string",
        required_error: "Image URL is required"
    }).url("Image URL must be a valid URL"),
    link: z.string({
        invalid_type_error: "Link must be a string",
        required_error: "Link is required"
    }).url("Link must be a valid URL"),
    isActive: z.boolean({
        invalid_type_error: "isActive must be a boolean",
        required_error: "isActive is required"
    }).default(true),
    order: z.number({
        invalid_type_error: "Order must be a number",
        required_error: "Order is required"
    }).min(0, "Order must be a non-negative number").default(0),
});

export type BannerType = z.infer<typeof bannerSchema>;
interface IBanner extends Document, BannerType {}
// Create the Mongoose schema
const bannerMongooseSchema: Schema = new Schema(
    {
        title: { type: String, required: true },
        description: { type: String, required: true },
        image: { type: String, required: true },
        link: { type: String, required: true },
        isActive: { type: Boolean, default: true },
        order: { type: Number, default: 0, min: 0 },
    },
    {
        versionKey: false,
        timestamps: true
    }
);
// Create and export the model
const Banner = mongoose.model<IBanner>('banners', bannerMongooseSchema);
export default Banner;
