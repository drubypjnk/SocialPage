import {Scrollama, Step} from 'react-scrollama';
import {videos} from '~/assets/videos';
import React, {useEffect, useRef} from 'react';
import styles from './Scrollama.module.scss';
import classNames from 'classnames/bind';
import {Link} from 'react-router-dom';
import Image from '~/components/Image';
import NavReactionMenu, {NavReactionItem} from '~/components/Post/Nav_Reaction';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import {faCheckCircle} from '@fortawesome/free-solid-svg-icons';
import {
    CommnetIcon,
    ReactionIcon, ShareIcon,
} from '~/components/Icons';

function ScrollamaVideo({data}) {
    let videoRef = useRef(null);
    let preVideoRef = useRef(null);
    const cx = classNames.bind(styles);

    const steps = videos; // Định nghĩa danh sách video
    const handleStepEnter = ({data}) => {
        // Mở video khi đạt tới step tương ứng
        // console.log('play video: ' + data.id);


        preVideoRef.current = videoRef.current;
        videoRef.current = data

        document.getElementById(videoRef.current.id).play();
        document.getElementById(preVideoRef.current.id).pause();
    };

    useEffect(() => {
        return () => {
            // Tắt video khi rời khỏi step
            const video = videoRef.current;
            // video.pause();
        };
    }, [videoRef]);

    return (
        <div>
            {/* Khoảng trống để tạo scroll */}
            <Scrollama onStepEnter={handleStepEnter}>
                {steps.map((step, index) => (
                    <Step key={index} data={step}>
                        <div
                            className={cx('container')}>

                            {/*avatar*/}
                            <Link to={`/@${data.nickname}`} className={cx('avatar')}>
                                <Image className={cx('avatar')} src={data.avatar.src} alt={data.avatar.title}/>
                            </Link>

                            {/*title */}
                            <div className={cx('content-container')}>
                                <Link to={`/@${data.nickname}`} className={cx('nav-ìnfor')}>
                                    <h4 className={cx('name')}>
                                        <p>{data.full_name}</p>
                                        {data.tick && <FontAwesomeIcon className={cx('check')} icon={faCheckCircle}/>}
                                    </h4>
                                    <span className={cx('username')}>{data.nickname}</span>
                                </Link>
                                <div className={cx('title')}>
                                    <span className={cx('title__word')}>
                                        TRÙM CUỐI mãi keo... #hongbeoi #hongpeoi #haihuoc #vuinhon #nhachayminmin #TikTokPromote
                                        #NhacHayMoiNgay #TikTokGiaiTri #theanh28 #theanh28trending
                                    </span>
                                </div>

                                {/*video */}
                                <div className={cx('title__Detail')}>
                                    <video

                                        title={'vid-title'}
                                        id={step.id}
                                        src={videos[index].src}
                                        ref={videoRef}
                                        controls/>

                                    <NavReactionMenu>
                                        <NavReactionItem to={''} title={'dung'}
                                                         icon={<ReactionIcon/>}
                                        />
                                        <NavReactionItem to={''} title={'dung'}
                                                         icon={<CommnetIcon/>}
                                        />
                                        <NavReactionItem to={''} title={'dung'}
                                                         icon={<ShareIcon/>}
                                        />
                                    </NavReactionMenu>
                                </div>

                            </div>
                        </div>
                    </Step>
                ))}
            </Scrollama>
            <div style={{height: '100vh'}}/>
            {/* Khoảng trống để tạo scroll */}
        </div>
    );
}

export default ScrollamaVideo;
