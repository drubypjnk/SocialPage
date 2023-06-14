import authenticatedService from '~/services/authenticatedService'
import { Navigate } from 'react-router-dom';

export default function AuthenticationRouter(props: { children: JSX.Element }) {
    const { children } = props;
    const authenService = new authenticatedService();
    const auth = authenService.isLogin(); //kiểm tra đã đăng nhập chưa bằng method isLoggedIn của keycloak
    console.log('islogin:'+auth);
    if (auth) {
        return children;
    } else {
        return <Navigate to="/login" />;
    }
}
