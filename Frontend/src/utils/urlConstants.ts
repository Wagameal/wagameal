// const baseUrl = 'http://localhost:3000/api';

const baseUrl = 'https://laughing-goldfish-jj5vg75jwqq3jjv7-3000.app.github.dev/api';
export const LOGIN = `${baseUrl}/auth/admin`;

export const GETUSERS = `${baseUrl}/user`;

export const GETUSER = (userId: string) => `${baseUrl}/user/${userId}`;


