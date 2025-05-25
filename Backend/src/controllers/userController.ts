import { Request, Response, NextFunction } from 'express';
import HttpException from '@/exceptions/HttpException';
import User, { userSchema } from '@/models/user';

export const getAllUser = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const users = await User.find();

    // Validate the response data
    const validatedUsers = users.map(user => userSchema.parse(user.toObject()));

    res.status(200).json({
      message: 'All users retrieved successfully',
      data: validatedUsers
    });
  } catch (error) {
    console.log((error))
    next(new HttpException(500, 'Internal Server Error'));
  }
};