import { Router } from "express";
import auth from './auth'
import users from './user'

const router = Router();


router.use('/auth', auth)

router.use('/user', users);


export default router;