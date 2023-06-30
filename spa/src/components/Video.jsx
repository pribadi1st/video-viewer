import React from "react";

import "./Video.css";

const Video = (props) => {
  const { url, title, thumbnails } = props;

  return (
    <div className="card video">
      <video
        controls
        src={url}
        preload="none"
        title={title}
        className="video-player"
        poster={thumbnails.large}
      />

      <div className="card-body">
        {title}
      </div>
    </div>
  );
};

export default Video;
