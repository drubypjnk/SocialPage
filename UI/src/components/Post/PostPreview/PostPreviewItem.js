import styles from './PostPreviewItem.module.scss';
import classNames from 'classnames/bind';
import { Link } from 'react-router-dom';
import Image from '~/components/Image';
import NavReactionMenu, { NavReactionItem } from '~/components/Post/Nav_Reaction';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faCheckCircle } from '@fortawesome/free-solid-svg-icons';
import {
    CommnetIcon,
    ReactionIcon, ShareIcon,
} from '~/components/Icons';

const cx = classNames.bind(styles);


function PostPreviewItem({ data }) {
    return <div className={cx('container')}>

        <Link to={`/@${data.nickname}`} className={cx('avatar')}>
            <Image className={cx('avatar')} src={data.avatar} alt={data.full_name} />
        </Link>
        <div className={cx('content-container')}>
            <Link to={`/@${data.nickname}`} className={cx('nav-ìnfor')}>
                <h3 className={cx('name')}>
                    <h4>{data.full_name}</h4>
                    {data.tick && <FontAwesomeIcon className={cx('check')} icon={faCheckCircle} />}
                </h3>
                <span className={cx('username')}>{data.nickname}</span>
            </Link>
            <div className={cx('title')}>
                <span className={cx('title__word')}>
                    TRÙM CUỐI mãi keo... #hongbeoi #hongpeoi #haihuoc #vuinhon #nhachayminmin #TikTokPromote
                    #NhacHayMoiNgay #TikTokGiaiTri #theanh28 #theanh28trending
                </span>
            </div>
            <div className={cx('title__Detail')}>
                <iframe
                    className={cx('video_container')}
                    title={'vid-title'}

                        src='https://www.youtube.com/embed/tgbNymZ7vqY'>
                </iframe>
                    <NavReactionMenu >
                        <NavReactionItem to={''} title={'dung'}
                                           icon={<ReactionIcon />}
                        />
                        <NavReactionItem to={''} title={'dung'}
                                         icon={<CommnetIcon />}
                        />
                        <NavReactionItem to={''} title={'dung'}
                                         icon={<ShareIcon />}
                        />
                    </NavReactionMenu>

            </div>
        </div>
    </div>;

}

export default PostPreviewItem;
