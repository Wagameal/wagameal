import * as urlConstants from '../urlConstants';
import * as apiBuilder from '../apiBuilder'


export const adminLogin = (data : any) => {
    return apiBuilder.postRequest(urlConstants.LOGIN, data);
}