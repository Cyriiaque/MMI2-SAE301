import {postRequest} from '../lib/api-request.js';

let UserData = {};

UserData.signup = async function (formdata) {
    let data = await postRequest('users/signup', formdata);
    return data;
}