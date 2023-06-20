import axios from 'axios';

export default class authenticatedService {

    isLogin = async () => {
        const storedUser = localStorage.getItem('user');
        if (storedUser) {
            return true;
        } else {
            return false;
        }
    };

    signin = async (data) => {
        try {
            const response = await axios.post('http://localhost:9000/api/v1/users/login', data);
            if (response.data.access_token) {
                localStorage.setItem('user', JSON.stringify(response.data));
            }
            console.log('Token: ' + response.data);
            return true;
        } catch (error) {
            console.error('error '+ error.message);
        }
            return false;
    };

    signOut() {
        localStorage.removeItem('user');
    }

    register = async (firstname, lastname, username, email, password) => {
        return axios.post('/api/auth/signup', {
            firstname,
            lastname,
            username,
            email,
            password,
        });
    };

    getCurrentUser() {
        return JSON.parse(localStorage.getItem('user'));
        ;
    }
}



