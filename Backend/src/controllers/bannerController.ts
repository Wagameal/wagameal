import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import HttpException from '@/exceptions/HttpException';
import Banner, { bannerSchema } from '@/models/banner';


export const createBanner = async (req: Request, res: Response, next: NextFunction) => {
    console.log('createBanner called');
    try {
        if (!req.user?.id) {
            return next(new HttpException(401, 'Admin is not authenticated'));
        }

        // Validate the request body against the banner schema
         const validatedData = bannerSchema.safeParse(req.body);
        if (!validatedData.success) {
            return next(new HttpException(500, 'Invalid banner data', validatedData.error));
        }
        
        const { title, description, image, link, isActive, order } = validatedData.data;
        // Create a new banner instance

        const newBanner = new Banner({
            title,
            description,
            image,
            link,
            isActive,
            order
        });
        // Save the banner to the database
        await newBanner.save();
        // Respond with the created banner
        res.status(201).json({
            success: true,
            message: 'Banner created successfully',
            data: newBanner
        });
    } catch (error) {
        if (error instanceof z.ZodError) {
            return next(new HttpException(500, 'Invalid banner data', error.errors));
        }
        // Handle other errors, such as database connection issues
        next(new HttpException(500, 'Error creating banner'));
    }

}

export const getBanners = async (req: Request, res: Response, next: NextFunction) => {
    try {
        if (!req.user?.id) {
            return next(new HttpException(401, 'Admin is not authenticated'));
        }

        const banners = await Banner.find();

        res.status(200).json(
            {
                success: true,
                message: 'Banners fetched successfully',
                data: banners
            }
        );
    } catch (error) {
        if (error instanceof z.ZodError) {
            return next(new HttpException(500, 'Invalid banner data', error.errors));
        }

        // Handle other errors, such as database connection issues
       next(new HttpException(500, 'Error fetching banners'));
    }
}

export const getBannerById = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const bannerId = req.params.id;
        const banner = await Banner.findById(bannerId);
        if (!banner) {
            return next(new HttpException(404, `Banner with id ${bannerId} not found`));
        }
        res.status(200).json(banner);
    } catch (error) {
        if (error instanceof z.ZodError) {
            return next(new HttpException(400, 'Invalid banner data', error.errors));
        }
        next(error);
    }
}

export const updateBanner = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const bannerId = req.params.id;
        const parsedData = bannerSchema.parse(req.body);
        const updatedBanner = await Banner.findByIdAndUpdate(bannerId, parsedData, { new: true });
        if (!updatedBanner) {
            return next(new HttpException(404, `Banner with id ${bannerId} not found`));
        }
        res.status(200).json(updatedBanner);
    } catch (error) {
        if (error instanceof z.ZodError) {
           return next(new HttpException(400, 'Invalid banner data', error.errors));
        }
        next(error);
    }
}

export const deleteBanner = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const bannerId = req.params.id;
        const deletedBanner = await Banner.findByIdAndDelete(bannerId);
        if (!deletedBanner) {
            return next(new HttpException(404, `Banner with id ${bannerId} not found`));
        }
        res.status(200).json({ message: 'Banner deleted successfully' });
    } catch (error) {
        next(error);
    }
}