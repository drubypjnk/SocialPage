import React, { useEffect, useRef } from 'react';
import { Scrollama, Step } from 'react-scrollama';
import MyVideo from "~/assets/images/Video1.mp4";

function ScrollamaVideo() {
    // const videoRef = useRef(null);
    // const steps = ['Video1', 'Video2', 'Video3']; // Định nghĩa danh sách video
    //
    // const handleStepEnter = ({ data }) => {
    //     // Mở video khi đạt tới step tương ứng
    //     const video = videoRef.current;
    //     video.src = `~/assets/images/${data}.mp4`;
    //     video.play();
    //     console.log('play video '+ video.src);
    // };
    //
    // useEffect(() => {
    //     // Tắt video khi rời khỏi step
    //     const video = videoRef.current;
    //
    //     return () => {
    //         video.pause();
    //     };
    // }, []);

    return (
    //     <div>
    //         <div style={{ height: '100vh' }} />
    //         {/* Khoảng trống để tạo scroll */}
    //         <Scrollama onStepEnter={handleStepEnter}>
    //             {steps.map((step, index) => (
    //                 <Step key={index} data={step}>
    //                     <div style={{ height: '100vh' }}>
    //                         {/* Vị trí video */}
    //                         {step === 'Video1' && (
    //                             <video src='~/assets/images/Video1.mp4' ref={videoRef} style={{ width: '100%', height: '100%' }} controls />
    //                         )}
    //                         {/*{step === 'Video2' && (*/}
    //                         {/*    <video src='src/lib/Videos/Video2.mp4' ref={videoRef} style={{ width: '100%', height: '100%' }} controls />*/}
    //                         {/*)}*/}
    //                         {/*{step === 'Video3' && (*/}
    //                         {/*    <video src='src/lib/Videos/Video3.mp4' ref={videoRef} style={{ width: '100%', height: '100%' }} controls />*/}
    //                         {/*)}*/}
    //                     </div>
    //
    //                 </Step>
    //             ))}
    //         </Scrollama>
    //         <div style={{ height: '100vh' }} />
    //         {/* Khoảng trống để tạo scroll */}
    //     </div>
    // );
        <video width="700px" height="700px" preload="auto">
            <source src={MyVideo} type="video/mp4" />
            Your browser does not support HTML5 video.
        </video>

    )
};

export default ScrollamaVideo;
