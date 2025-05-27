import { Router } from 'express'

import { 
    createMeal, 
    getMeals, 
    getMealById, 
    updateMeal, 
    deleteMeal 
} from '@/controllers/mealController';
import authenticateToken from '@/middleware/auth';

const router = Router();

router.post('/', authenticateToken, createMeal);

router.get('/', authenticateToken, getMeals);

router.get('/:id', authenticateToken, getMealById);

router.put('/:id', authenticateToken, updateMeal);

router.delete('/:id', authenticateToken, deleteMeal);

export default router;
