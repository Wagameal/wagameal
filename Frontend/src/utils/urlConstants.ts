const baseUrl = 'http://localhost:3000/api';

export const LOGIN = `${baseUrl}/auth/admin`;

export const GETUSERS = `${baseUrl}/user`;

export const GETUSER = (userId: string) => `${baseUrl}/user/${userId}`;


