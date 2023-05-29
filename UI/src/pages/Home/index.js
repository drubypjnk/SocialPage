import styles from './home.module.scss';
import classNames from 'classnames/bind';
import avt from '~/assets/images/dungbui_avt.jpg';
import ScrollamaVideo from '~/components/ScrollamaVideo'

const cx = classNames.bind(styles);
const data = {
    avatar:{
        src:'https://scontent.fhan14-1.fna.fbcdn.net/v/t39.30808-6/328903575_3300132393572930_6488716328426368793_n.jpg?stp=dst-jpg_p640x640&_nc_cat=105&ccb=1-7&_nc_sid=174925&_nc_ohc=7KPjOJffvsoAX8jK3x4&_nc_ht=scontent.fhan14-1.fna&oh=00_AfDvGwst92VLaXLoNeDSE2Hke0rfKW3wG0sSL-5pJPMRJg&oe=647A0C4B',
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
    return<aside className={cx('wrapper')}>
        {/*<Menu>*/}
        {/*    <PostPreviewItem  data={data} />*/}
        {/*    <PostPreviewItem  data={data} />*/}
        {/*    <PostPreviewItem  data={data} />*/}
        {/*</Menu>*/}
        <ScrollamaVideo data={data}/>
    </aside>
}

export default Home;
