import PostPreviewItem from '~/components/Post/PostPreview';
import Image from '~/components/Image';
import styles from './home.module.scss';
import classNames from 'classnames/bind';
import avt from '~/assets/images/dungbui_avt.jpg';

const cx = classNames.bind(styles);
const data = {
    avatar:{
        src:avt.src,
        title:'dungbui_avt'
    },
    full_name : 'Dũng Bùi',
    nickname : 'Dung Bui',
    tick : true,
    title : 'Nhật thực lai cực hiếm gặp sắp diễn ra vào 20/4 tới🤯',
    video : 'video',
    reactions : 'reactions'
}

function Home() {
    return <PostPreviewItem
       data={data}
    />;
    return <PostPreviewItem
        data={data}
    />;

}

export default Home;
