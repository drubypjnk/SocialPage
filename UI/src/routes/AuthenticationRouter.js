export default function AuthenticationRouter(props: { children: JSX.Element }) {
    const { children } = props;
    const auth = UserService.isLoggedIn(); //kiểm tra đã đăng nhập chưa bằng method isLoggedIn của keycloak

    if (auth) {
        return children;
    } else {
        return <Navigate to="/login" />;
    }
}
