import React from "react";
import "./Video.css";
import { IVideo } from "../types/video";

const Video = (props: {
  video: IVideo
}) => {
  const { url, title, thumbnails, category } = props.video;
  const [show, setShow] = React.useState(false);
  const showTitle = (state: boolean = false) => {
    setShow(state)
  }

  return (
    <div
      className="card video"
      onMouseEnter={() => showTitle(true)}
      onMouseLeave={() => showTitle(false)}
    >
      <video
        controls
        src={url}
        preload="none"
        title={title}
        className="video-player"
        poster={thumbnails.large}
      />
      {
        show && 
          <div className="position-absolute top-0 start-0 bg-light w-100">
            <p className="mt-3">
              {title}
            </p>
          </div>
      }

      <div className="card-body">
        {category.text}
      </div>
    </div>
  );
};

export default Video;
