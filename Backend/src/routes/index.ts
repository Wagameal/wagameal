import { Router } from "express";
import auth from './auth'
import user from './user'
import pet from "./pet";
import meal from "./meal";
import banner from "./banner";

const router = Router();


router.use('/auth', auth);

router.use('/user', user);

router.use('/pet', pet);

router.use('/meal', meal);

router.use('/banner', banner);


export default router;