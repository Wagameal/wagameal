import { Router } from "express";
import auth from './auth'
import user from './user'
import pet from "./pet";
import meal from "./meal";

const router = Router();


router.use('/auth', auth);

router.use('/user', user);

router.use('/pet', pet);

router.use('/meal', meal);


export default router;