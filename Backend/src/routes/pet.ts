import { Router } from 'express'
import { createPet, getPetDetails, getPetDetailById, updatePetDetails, deletePetDetails} from '@/controllers/petController'
import authenticateToken from '@/middleware/auth';

const router = Router()

// Route to add a new pet
router.post('/', authenticateToken, createPet);

// Route to get all pets
router.get('/', authenticateToken, getPetDetails);

// Route to get a specific pet by ID
router.get('/:id', authenticateToken, getPetDetailById);

// Route to update an existing pet
router.put('/:id', authenticateToken, updatePetDetails);

// Route to delete a pet
router.delete('/:id', authenticateToken, deletePetDetails);


export default router;