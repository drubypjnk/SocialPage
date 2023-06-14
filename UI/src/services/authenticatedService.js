import axios from 'axios';

class authenticatedService {

    // signin = (data) => {
    //     return fetch('http://localhost:8600/api/v1/users/login', {
    //         method: 'POST',
    //         headers: {
    //             'Content-Type': 'application/json',
    //             'Access-Control-Allow-Origin': '*', // Địa chỉ domain mà bạn cho phép truy cập
    //         },
    //         body: JSON.stringify({ data }),
    //     })
    //         .then(response => {
    //             if (response.ok) {
    //                 return response.json();
    //             } else {
    //                 throw new Error('Request failed.');
    //             }
    //         })
    //         .then(data => {
    //             if (data.access_token) {
    //                 localStorage.setItem('user', JSON.stringify(data));
    //             }
    //             console.log('token:' + data);
    //             return data;
    //         })
    //         .catch(err => {
    //             console.log(err);
    //             throw err;
    //         });
    // };
    signin = (data) => {
            const instance = axios.create({
                baseURL: 'http://localhost:8600',
                // Cấu hình Access-Control-Allow-Origin
                headers: {
                    'Access-Control-Allow-Origin': '*', // Địa chỉ domain mà bạn cho phép truy cập
                },
    });
        return instance.post('http://localhost:8600/api/v1/users/login', { data })
            .then(response => {
                if (response.data.access_token) {
                    localStorage.setItem('user', JSON.stringify(response.data));
                }
                console.log('token:' + response.data);
                return response.data;
            })
            .catch(err => {
                console.log(err);
                throw err;
            });
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
