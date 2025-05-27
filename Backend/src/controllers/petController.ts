import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import HttpException from '@/exceptions/HttpException';
import Pet from '@/models/pet';
import { RequestPetSchema } from '@/schema/common';
import { Types } from 'mongoose';



export const createPet = async (req: Request, res: Response, next: NextFunction) => {
  try {
    if (!req.user?.id) {
      return next(new HttpException(401, 'User not authenticated'));
    }

    const validatedData = RequestPetSchema.safeParse(req.body);

    if (!validatedData.success) {
      return next(new HttpException(400, 'Invalid pet data', validatedData.error));
    }

    const { name, type, age, breed, weight, notes } = validatedData.data;

    const newPet = new Pet({
      name,
      type,
      age,
      breed,
      weight,
      notes,
      owner: new Types.ObjectId(req.user.id)
    });
    await newPet.save();
    res.status(201).json({
      success: true,
      message: 'Pet created successfully',
      data: newPet
    });
  } catch (error) {
    if (error instanceof z.ZodError) {
      return next(new HttpException(400, 'Invalid pet data', error.errors));
    }
    next(new HttpException(500, 'Error creating pet'));
  }
};

export const getPetDetails = async (req: Request, res: Response, next: NextFunction) => {
  try {
    if (!req.user?.id) {
      return next(new HttpException(401, 'User not authenticated'));
    }
    const pets = await Pet.find({ owner: req.user?.id });

    res.status(200).json({
      success: true,
      message: 'Pets fetched successfully',
      data: pets
    });

  } catch (error) {
    if (error instanceof z.ZodError) {
      return next(new HttpException(400, 'Invalid request data', error.errors));
    }
    next(new HttpException(500, 'Error fetching pets'));
  }
};

export const getPetDetailById = async (req: Request, res: Response, next: NextFunction) => {
  try {
    if (!req.user?.id) {
      return next(new HttpException(401, 'User not authenticated'));
    }

    const petId = req.params.id;
    if (!petId) {
      return next(new HttpException(400, 'Pet ID is required'));
    }

    const pet = await Pet.findOne({ _id: petId, owner: req.user.id });
    if (!pet) {
      return next(new HttpException(404, 'Pet not found'));
    }

    res.status(200).json({
      success: true,
      message: 'Pet details fetched successfully',
      data: pet
    });
  } catch (error) {
    if (error instanceof z.ZodError) {
      return next(new HttpException(400, 'Invalid request data', error.errors));
    }
    next(new HttpException(500, 'Error fetching pet details'));
  }
};


export const updatePetDetails = async (req: Request, res: Response, next: NextFunction) => {
  try {
    if (!req.user?.id) {
      return next(new HttpException(401, 'User not authenticated'));
    }

    const petId = req.params.id;
    if (!petId) {
      return next(new HttpException(400, 'Pet ID is required'));
    }

    const validatedData = RequestPetSchema.safeParse(req.body);
    if (!validatedData.success) {
      return next(new HttpException(400, 'Invalid pet data', validatedData.error));
    }

    const { name, type, age, breed, weight, notes } = validatedData.data;

    const updatedPet = await Pet.findOneAndUpdate(
      { _id: petId, owner: req.user.id },
      { name, type, age, breed, weight, notes },
      { new: true }
    )

    await updatedPet?.save();

    if (!updatedPet) {
      return next(new HttpException(404, 'Pet not found'));
    }

    res.status(200).json({
      success: true,
      message: 'Pet updated successfully',
      data: updatedPet
    });
  } catch (error) {
    if (error instanceof z.ZodError) {
      return next(new HttpException(400, 'Invalid pet data', error.errors));
    }
    next(new HttpException(500, 'Error updating pet'));
  }
};

export const deletePetDetails = async (req: Request, res: Response, next: NextFunction) => {
  try {
    if (!req.user?.id) {
      return next(new HttpException(401, 'User not authenticated'));
    }

    const petId = req.params.id;
    if (!petId) {
      return next(new HttpException(400, 'Pet ID is required'));
    }

    const pet = await Pet.findOneAndDelete({ _id: petId, owner: req.user.id });
    if (!pet) {
      return next(new HttpException(404, 'Pet not found'));
    }

    res.status(200).json({
      success: true,
      message: 'Pet deleted successfully',
    });
  } catch (error) {
    if (error instanceof z.ZodError) {
      return next(new HttpException(400, 'Invalid request data', error.errors));
    }
    next(new HttpException(500, 'Error deleting pet'));
  }
};