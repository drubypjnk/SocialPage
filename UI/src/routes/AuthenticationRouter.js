import authenticatedService from '~/services/authenticatedService'
import { Navigate } from 'react-router-dom';
import Header from '~/layouts/components/Header';
import Sidebar from '~/layouts/components/Sidebar';

export default function AuthenticationRouter({children}) {

    const authenService = new authenticatedService();
    const auth = authenService.isLogin(); //kiểm tra đã đăng nhập chưa bằng method isLoggedIn của keycloak
    console.log('islogin:'+auth);
    if (auth) {
        return (
            <div className={cx('wrapper')}>
                <Header />
                <div className={cx('container')}>
                    <Sidebar />
                    <div className={cx('content')}>{children}</div>
                </div>
            </div>
        );
    } else {
        return <Navigate to="/login" />;
    }
}
