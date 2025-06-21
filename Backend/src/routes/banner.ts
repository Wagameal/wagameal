import { Router } from 'express'

import { 
    createBanner, 
    getBanners, 
    getBannerById, 
    updateBanner, 
    deleteBanner 
} from '@/controllers/bannerController';

import authenticateToken from '@/middleware/auth';

const router = Router();


router.post('/', authenticateToken, createBanner);

router.get('/', authenticateToken, getBanners);

router.get('/:id', authenticateToken, getBannerById);

router.put('/:id', authenticateToken, updateBanner);

router.delete('/:id', authenticateToken, deleteBanner);

export default router;