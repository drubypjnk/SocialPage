import classNames from 'classnames/bind';
import AuthenticatedService from '~/services/authenticatedService'
import styles from './login.module.scss';
import React, { useState } from 'react';

const cx = classNames.bind(styles);
    const authenService = new AuthenticatedService();

function LoginForm() {
    const handleUsernameChange = (event) => {
        setUsername(event.target.value);
    };

    const handlePasswordChange = (event) => {
        setPassword(event.target.value);
    };

    function login(event) {
        event.preventDefault();

        let formData = new FormData();
        formData.append("username", username);
        formData.append("password", password);
        let data = JSON.stringify(formData);
        authenService.signin(data)
    }
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    return (
        <div className={cx('login')}>
            <div className={cx('login-triangle')}></div>
            <h2 className={cx('login-header')}>Log in</h2>
            <form className={cx('login-container')} onSubmit={login}>
                <p><input value={username} type='text' placeholder='Email'
                          onChange={handleUsernameChange}/></p>
                <p><input  value={password} type='password' placeholder='Password'
                           onChange={handlePasswordChange}/></p>
                <p><input  type='submit' value='Log in' /></p>
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
