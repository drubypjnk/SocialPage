export default function ProtectedRouter(props: { children: JSX.Element }) {
    const { children } = props;
    const location = useLocation();
    const auth = UserService.isLoggedIn();

    if (!auth) {
        return children;
    } else {
        return <Navigate to="/" state={{ from: location }} />;
    }
}
