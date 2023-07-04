import React, { useState, useEffect } from "react";
import Video from "./Video";
import { IVideo } from "../types/video";
import { listVideos } from "../services/API";

const VideoList = () => {
  const [videos, setVideos] = useState<IVideo[]>([]);

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
            video={video}
          />
        ))
      )}
    </div>
  );
};

export default VideoList;
