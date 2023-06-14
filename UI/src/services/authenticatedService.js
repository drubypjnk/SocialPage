import axios from 'axios';

class authenticatedService {

    isLogin = async () => {
        const storedUser = localStorage.getItem('user');
       return  storedUser == null ;
    };

    signin = async (data) => {
        try {
            console.log(JSON.stringify(data));
            const response = await axios.post('http://localhost:9000/api/v1/users/login', data);
            if (response.data.access_token) {
                localStorage.setItem('user', JSON.stringify(response.data));
            }
            console.log('Token: ' + response.data);
            return response.data;
        } catch (error) {
            console.error(error);
            throw error;
        }
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

export default authenticatedService;
