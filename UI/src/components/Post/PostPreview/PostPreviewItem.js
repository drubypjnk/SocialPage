import styles from './PostPreviewItem.module.scss';
import classNames from 'classnames/bind';
import { Link } from 'react-router-dom';
import Image from '~/components/Image';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faCheckCircle } from '@fortawesome/free-solid-svg-icons';


const cx = classNames.bind(styles);



function PostPreviewItem({data}) {
    return <div className={cx('container')} >

                <Link to ={`/@${data.nickname}`} className={cx('avatar')} >
                    <Image className={cx('avatar')} src={data.avatar} alt={data.full_name} />
                </Link>
                <div className={cx('content-container')}>
                    <Link to ={`/@${data.nickname}`} className={cx('nav-ìfor')} >
                        <h4 className={cx('name')}>
                            <span>{data.full_name}</span>
                            {data.tick && <FontAwesomeIcon className={cx('check')} icon={faCheckCircle} />}
                        </h4>
                        <span className={cx('username')}>{data.nickname}</span>
                    </Link>
                    <div className={cx('title__Detail')}>
                        <p>
                            TRÙM CUỐI mãi keo... #hongbeoi #hongpeoi #haihuoc #vuinhon #nhachayminmin #TikTokPromote #NhacHayMoiNgay #TikTokGiaiTri #theanh28 #theanh28trending
                        </p>
                    </div>
                    <div className={cx('title__Detail')}>
                        <iframe width="420" height="315"
                                src="https://www.youtube.com/embed/tgbNymZ7vqY">
                        </iframe>
                    </div>
                </div>
           </div>;
    <h1></h1>
}

export default PostPreviewItem;
