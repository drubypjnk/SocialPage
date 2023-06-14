import PropTypes from 'prop-types';
import classNames from 'classnames/bind';
import Header from '~/layouts/components/Header';
import Sidebar from '~/layouts/components/Sidebar';
import styles from './DefaultLayout.module.scss';
const cx = classNames.bind(styles);

function DefaultLayout({ children }){
    return(
        <div>{children}</div>

    );
}
