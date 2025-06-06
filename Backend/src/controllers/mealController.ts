import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import HttpException from '@/exceptions/HttpException';
import Meal, { mealSchema } from '@/models/meal';


export const createMeal = async (req: Request, res: Response, next: NextFunction) => {
    try {
        if (!req.user?.id) {
            return next(new HttpException(401, 'Admin is not authenticated'));
        }

        const validatedData = mealSchema.safeParse(req.body);

        if (!validatedData.success) {
            return next(new HttpException(400, 'Invalid pet data', validatedData.error));
        }

        const { name, type, description, quantity, unit, price } = validatedData.data;

        const newMeal = new Meal({
            name,
            type,
            description,
            quantity,
            unit,
            price
        });

        await newMeal.save();

        res.status(201).json({
            success: true,
            message: 'Meal created successfully',
            data: newMeal
        });
    } catch (error) {
        if (error instanceof z.ZodError) {
            return next(new HttpException(400, 'Invalid meal data', error.errors));
        }
        next(new HttpException(500, 'Error creating meal'));
    }
};

export const getMeals = async (req: Request, res: Response, next: NextFunction) => {
    try {
        if (!req.user?.id) {
            return next(new HttpException(401, 'Admin is not authenticated'));
        }

        const meals = await Meal.find();
        res.status(200).json({
            success: true,
            message: 'Meals fetched successfully',
            data: meals
        });
    } catch (error) {
        if (error instanceof z.ZodError) {
            return next(new HttpException(400, 'Invalid meal data', error.errors));
        }
        next(new HttpException(500, 'Error fetching meals'));
    }
};

export const getMealById = async (req: Request, res: Response, next: NextFunction) => {
    try {
        if (!req.user?.id) {
            return next(new HttpException(401, 'Admin is not authenticated'));
        }

        const meal = await Meal.findById(req.params.id);
        if (!meal) {
            return next(new HttpException(404, 'Meal not found'));
        }

        res.status(200).json({
            success: true,
            message: 'Meal fetched successfully',
            data: meal
        });
    } catch (error) {
        if (error instanceof z.ZodError) {
            return next(new HttpException(400, 'Invalid meal data', error.errors));
        }
        next(new HttpException(500, 'Error fetching meal'));
    }
};

export const updateMeal = async (req: Request, res: Response, next: NextFunction) => {
    console.log('Updating meal with ID:', req.params.id);
    try {
        if (!req.user?.id) {
            return next(new HttpException(401, 'Admin is not authenticated'));
        }

        const validatedData = mealSchema.safeParse(req.body);

        if (!validatedData.success) {
            return next(new HttpException(400, 'Invalid meal data', validatedData.error));
        }

        const { name, type, description, quantity, unit, price } = validatedData.data;

        const updatedMeal = await Meal.findByIdAndUpdate(
            req.params.id,
            { name, type, description, quantity, unit, price },
            { new: true }
        );

        if (!updatedMeal) {
            return next(new HttpException(404, 'Meal not found'));
        }

        res.status(200).json({
            success: true,
            message: 'Meal updated successfully',
            data: updatedMeal
        });
    } catch (error) {
        if (error instanceof z.ZodError) {
            return next(new HttpException(400, 'Invalid meal data', error.errors));
        }
        next(new HttpException(500, 'Error updating meal'));
    }
};

export const deleteMeal = async (req: Request, res: Response, next: NextFunction) => {
    try {
        if (!req.user?.id) {
            return next(new HttpException(401, 'Admin is not authenticated'));
        }

        const meal = await Meal.findByIdAndDelete(req.params.id);
        if (!meal) {
            return next(new HttpException(404, 'Meal not found'));
        }

        res.status(200).json({
            success: true,
            message: 'Meal deleted successfully',
        });
    } catch (error) {
        if (error instanceof z.ZodError) {
            return next(new HttpException(400, 'Invalid meal data', error.errors));
        }
        next(new HttpException(500, 'Error deleting meal'));
    }
};