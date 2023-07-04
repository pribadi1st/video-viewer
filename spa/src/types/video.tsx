export interface IVideo {
    id: number
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