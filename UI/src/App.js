import React, { Fragment, useEffect, useState } from 'react';
import { Route, Routes, useNavigate } from 'react-router-dom';
import { publicRoutes } from '~/routes';

import DefaultLayout from '~/layouts';
import { default as authenticatedService } from '~/services/authenticatedService';

function App() {
    let authenticated = new authenticatedService();
    const [isLoggedIn, setIsLoggedIn] = useState(false);
    const navigate = useNavigate();

    useEffect(() => {
        //
        // setIsLoggedIn(authenticated.isLogin());
        // if (isLoggedIn==false) {
        //     navigate('/login');
        // }
        const checkLogin = async () => {
            try {
                const result = await isLoggedIn;
                setIsLoggedIn(result);

                if (isLoggedIn == false) {
                    navigate('/login');
                }

            } catch (error) {
                console.error(error);
            }
        };

        checkLogin();
    }, []);
    return (
        // <Router>
        <div className='App'>
            <Routes>
                {publicRoutes.map((route, index) => {
                    const Page = route.component;
                    let Layout = DefaultLayout;

                    if (route.layout) {
                        Layout = route.layout;
                    } else if (route.layout === null) {
                        Layout = Fragment;
                    }

                    // return <Navigate to="/login" />;
                    return (
                        <Route
                            key={index}
                            path={route.path}
                            element={
                                <Layout>
                                    {/*<Navigate to="/login" replace={true} />*/}
                                    <Page />
                                </Layout>
                            }
                        />
                    );
                })}
            </Routes>
        </div>

        // </Router>
    );
}

export default App;
