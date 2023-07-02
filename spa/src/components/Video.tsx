import React from "react";

import "./Video.css";
interface VideoProps {
  url: string
  title: string
  thumbnails: {
    small: string
    medium: string
    large: string
  }
  category: {
    text: string
    value: number
  }
}

const Video = (props:VideoProps) => {
  const { url, title, thumbnails, category } = props;

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
        {category.text}
      </div>
    </div>
  );
};

export default Video;
