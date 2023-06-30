import React, { useState, useEffect } from "react";
import Video from "../components/Video";
import { listVideos } from "../services/API";

const VideoList = () => {
  const [videos, setVideos] = useState([]);

  useEffect(() => {
    listVideos()
      .then(response => {
        const { data, status } = response
        if(status === 200)
          setVideos(data)
      });
  }, []);

  return (
    <div className="video-list">
      {!videos.length ? (
        <p>No videos uploaded yet!</p>
      ) : (
        videos.map((video) => (
          <Video
            key={video.id}
            title={video.title}
            url={video.url}
            thumbnails={video.thumbnails}
          />
        ))
      )}
    </div>
  );
};

export default VideoList;
