import PropTypes from 'prop-types';
import classNames from 'classnames/bind';
import styles from '~/components/Post/PostPreview/PostPreviewItem.module.scss';

const cx = classNames.bind(styles);

function NavReactionMenu({ children }) {
    return <nav className={cx('reaction_nav_container')}>{children}</nav>;
}

NavReactionMenu.propTypes = {
    children: PropTypes.node.isRequired,
};

export default NavReactionMenu;
