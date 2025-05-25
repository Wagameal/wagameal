import { Router } from 'express'
import { 
    login, 
    verifyOtp, 
    resendOtp, 
    signUp, 
    sendEmailOtp,
    verifyEmail,
    adminLogin
} from '@/controllers/authController';

const router = Router();

router.post('/login', login);

router.post('/verify', verifyOtp);

router.post('/resend-otp', resendOtp);

router.post('/send-email-otp', sendEmailOtp);

router.post('/verify-email', verifyEmail);

router.post('/signup', signUp);

// This function is for admin login 
router.post('/admin', adminLogin);

export default router;
