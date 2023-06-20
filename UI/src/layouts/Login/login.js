import classNames from 'classnames/bind';
import AuthenticatedService, { default as authenticatedService } from '~/services/authenticatedService';

import styles from './login.module.scss';
import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';

const authenService = new AuthenticatedService();


function LoginForm() {
const cx = classNames.bind(styles);
    const navigate = useNavigate();
    let authenticated = new authenticatedService();

    const [isLoggedIn, setIsLoggedIn] = useState(false);
    // useEffect(() => {
    //     const result = await authenticated.isLogin();
    //     setIsLoggedIn(authenticated.isLogin());
    //     console.log('isLoggedIn: ' + authenticated.isLogin());
    //     if (isLoggedIn == false) {
    //         navigate('/login');
    //     }
    // }, []);

    useEffect(() => {
        const checkLoginState = async () => {
            try {
                const result = await authenticated.isLogin();
                console.log('result:' + result);
                setIsLoggedIn(result);

                if (!isLoggedIn) {
                    navigate('/login');
                } else {
                    navigate('/');

                }
            } catch (error) {
                console.error(error);
            }
        };

        checkLoginState();
    }, [useNavigate, isLoggedIn]);

    class LoginRequest {
        constructor(username, password) {
            this.username = username;
            this.password = password;
        }
    }

    const handleUsernameChange = (event) => {
        setUsername(event.target.value);
    };

    const handlePasswordChange = (event) => {
        setPassword(event.target.value);
    };

    async function login(event) {
        event.preventDefault();
        const loginRequest = new LoginRequest(username, password);
        let checkLogin = await authenService.signin(loginRequest);
        console.log('checklogin' + checkLogin);
        if (checkLogin) {
            navigate('/');
        } else {
            navigate('/login');
        }
    }

    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    return (
        <div className={cx('login')}>
            <div className={cx('login-triangle')}></div>
            <h2 className={cx('login-header')}>Log in</h2>
            <form className={cx('login-container')} onSubmit={login}>
                <p><input value={username} type='text' placeholder='Email'
                          onChange={handleUsernameChange} /></p>
                <p><input value={password} type='password' placeholder='Password'
                          onChange={handlePasswordChange} /></p>
                <p><input type='submit' value='Log in' /></p>
            </form>
        </div>
    );
}

function Logout() {
    return (
        <div>Logout Form</div>
    );
}

export default LoginForm;
